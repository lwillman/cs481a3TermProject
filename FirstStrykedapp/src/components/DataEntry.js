import React, { Component } from 'react';
import {Card} from "reactstrap";
import './app.css';

import TextInput from './textinput';
import validate from './validation';
import Select from './select';
import Radio from './radio';

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
                longitude: {
                    value: '',
                    placeholder: 'Longitude',
                    valid: false,
                    validationRules: {
                        isRequired: true
                    },
                    touched: false
                },
                latitude: {
                    value: '',
                    placeholder: 'Latitude',
                    valid: false,
                    validationRules: {
                        isRequired: true
                    },
                    touched: false
                },
                ageGroup: {
                    value: '',
                    placeholder: 'Select age group',
                    valid: false,
                    touched: false,
                    validationRules: {
                        isRequired: true,
                    },
                    options: [
                        {value: 1, displayValue: '0 - 10'},
                        {value: 2, displayValue: '11 - 20'},
                        {value: 3, displayValue: '21 - 30'},
                        {value: 4, displayValue: '31 - 45'},
                        {value: 5, displayValue: '46 - 60'},
                        {value: 6, displayValue: '61 +'}
                    ]
                },
                gender: {
                    value: '',
                    placeholder: 'What is your gender',
                    valid: false,
                    touched: false,
                    validationRules: {
                        isRequired: true,
                    },
                    options: [
                        {value: 'male', displayValue: 'Male'},
                        {value: 'female', displayValue: 'Female'}
                    ]
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

                    <TextInput name="longitude"
                              placeholder={this.state.formControls.longitude.placeholder}
                              value={this.state.formControls.longitude.value}
                              onChange={this.changeHandler}
                              touched={this.state.formControls.longitude.touched}
                              valid={this.state.formControls.longitude.valid}
                    />

                    <TextInput name="latitude"
                              placeholder={this.state.formControls.latitude.placeholder}
                              value={this.state.formControls.latitude.value}
                              onChange={this.changeHandler}
                              touched={this.state.formControls.latitude.touched}
                              valid={this.state.formControls.latitude.valid}
                    />

                    <Radio name="my_radio"
                           value={this.state.formControls.ageGroup.value}
                           onChange={this.changeHandler}
                           options={this.state.formControls.ageGroup.options}
                           touched={this.state.formControls.ageGroup.touched}
                           valid={this.state.formControls.ageGroup.valid}
                    />

                    <Select name="gender"
                            value={this.state.formControls.gender.value}
                            onChange={this.changeHandler}
                            options={this.state.formControls.gender.options}
                            touched={this.state.formControls.gender.touched}
                            valid={this.state.formControls.gender.valid}
                    />

                    <button onClick={this.formSubmitHandler}
                            disabled={! this.state.formIsValid}
                    >
                        Submit
                    </button>
                </Card>
            </div>
        );

    }
}

export default DataEntry;