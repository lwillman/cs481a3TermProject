import React, { Component } from 'react';
import {Card} from "reactstrap";
import { connect } from "react-redux";
import './app.css';

import TextInput from './textinput';
import validate from './validation';

function mapStatetoProps(state) {
    return{
        FS: state.FS,
        userAddress: state.userAddress
    };
}

class DataEntry extends Component {
    state = {
            formIsValid: false,
            formControls: {
                name: {
                    value: '',
                    placeholder: 'Virus name',
                    valid: false,
                    validationRules: {
                        isRequired: true
                    },
                    touched: false
                },
                location: {
                    value: '',
                    placeholder: 'Location Name',
                    valid: false,
                    validationRules: {
                        isRequired: false
                    },
                    touched: false
                },
                latLong: {
                    value: '',
                    placeholder: 'Latitude, Longitude',
                    valid: false,
                    validationRules: {
                        isRequired: true
                    },
                    touched: false
                },
            }

        }
    async componentDidMount() {
        let FS = this.state.FS;
        this.setState( {
            FS
        });
    }

    changeHandler = event => {

        const name = event.target.name;
        const value = event.target.value;

        const updatedControls = {
            ...this.state.formControls
        };
        const updatedFormElement = {
            ...updatedControls[name]
        };
        updatedFormElement.value = value;
        updatedFormElement.touched = true;
        updatedFormElement.valid = validate(value, updatedFormElement.validationRules);

        updatedControls[name] = updatedFormElement;

        let formIsValid = true;
        for (let inputIdentifier in updatedControls) {
            formIsValid = updatedControls[inputIdentifier].valid && formIsValid;
        }

        this.setState({
            formControls: updatedControls,
            formIsValid: formIsValid
        });

    }


    formSubmitHandler = async event => {
        event.preventDefault();
        const formData = {};
        for (let formElementId in this.state.formControls) {
            formData[formElementId] = this.state.formControls[formElementId].value;
        }

        console.dir(formData);
        try{
            await this.props.FS.methods._createPatient(formData.name, formData.location, formData.latLong).send({
                from: this.props.userAddress
            });
        } catch (e) {
            console.log(e.message);
        }
        this.setState({
            formIsValid: false,
            formControls: {
                name: {
                    value: '',
                    placeholder: 'Virus name',
                    valid: false,
                    validationRules: {
                        isRequired: true
                    },
                    touched: false
                },
                location: {
                    value: '',
                    placeholder: 'Location Name',
                    valid: false,
                    validationRules: {
                        isRequired: false
                    },
                    touched: false
                },
                latLong: {
                    value: '',
                    placeholder: 'Latitude, Longitude',
                    valid: false,
                    validationRules: {
                        isRequired: true
                    },
                    touched: false
                },
        },});
    }


    render() {

        return (
            <div className="DataEntry">
                <Card className="Card">
                    <TextInput name="name"
                               placeholder={this.state.formControls.name.placeholder}
                               value={this.state.formControls.name.value}
                               onChange={this.changeHandler}
                               touched={this.state.formControls.name.touched}
                               valid={this.state.formControls.name.valid}/>

                    <TextInput name="location"
                              placeholder={this.state.formControls.location.placeholder}
                              value={this.state.formControls.location.value}
                              onChange={this.changeHandler}
                              touched={this.state.formControls.location.touched}
                              valid={this.state.formControls.location.valid}
                    />

                    <TextInput name="latLong"
                              placeholder={this.state.formControls.latLong.placeholder}
                              value={this.state.formControls.latLong.value}
                              onChange={this.changeHandler}
                              touched={this.state.formControls.latLong.touched}
                              valid={this.state.formControls.latLong.valid}
                    />

                    <input type="submit" value="Submit" onClick={this.formSubmitHandler}
                           disabled={! this.state.formIsValid} />

                </Card>
            </div>
        );

    }
}

export default connect(mapStatetoProps)(DataEntry);
