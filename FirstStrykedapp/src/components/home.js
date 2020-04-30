import React, {Component} from "react";
import Map from './images/worldmap.jpg';

export default class Home extends React.Component {
    render() {
        return (
            <div>
                <img src={Map} alt="Hi!" width="102%" height="102%"/>
            </div>
        );
    }
}
