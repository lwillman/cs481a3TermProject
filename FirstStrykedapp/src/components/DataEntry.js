import React, { Component } from 'react';
import {Card} from "reactstrap";
import './app.css';

import TextInput from './textinput';
import validate from './validation';

class DataEntry extends Component {
    constructor(props) {
        super(props);
        this.state = {
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
                count: {
                    value: '',
                    placeholder: 'Patient Count',
                    valid: false,
                    validationRules: {
                        isRequired: true
                    },
                    touched: false
                }

            }

        }
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


    formSubmitHandler = () => {
        const formData = {};
        for (let formElementId in this.state.formControls) {
            formData[formElementId] = this.state.formControls[formElementId].value;
        }

        console.dir(formData);
    }


    render() {

        return (
            <div className="DataEntry">
                <Card>
                    <TextInput name="name"
                               placeholder={this.state.formControls.name.placeholder}
                               value={this.state.formControls.name.value}
                               onChange={this.changeHandler}
                               touched={this.state.formControls.name.touched}
                               valid={this.state.formControls.name.valid}
                    />

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

                    <TextInput name="count"
                              placeholder={this.state.formControls.count.placeholder}
                              value={this.state.formControls.count.value}
                              onChange={this.changeHandler}
                              touched={this.state.formControls.count.touched}
                              valid={this.state.formControls.count.valid}
                    />

                    <input type="submit" value="Submit" />

                </Card>
            </div>
        );

    }
}

export default DataEntry;