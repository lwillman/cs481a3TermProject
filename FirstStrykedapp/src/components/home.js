import React from "react";
import logo from "./images/FirstStryke.png";

class Home extends React.Component {
    render() {
        return(
            <div className="Logo">
                <style>{'body { background-color: #282c34'}</style>
                <img src={logo} width="98%" height="95%"/>
            </div>
        );
    }
}

export default Home;
