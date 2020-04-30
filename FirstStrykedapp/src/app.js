import React, { Component } from "react";
import getWeb3 from "./utils/getWeb3";
import initBlockchain from "./utils/initBlockchain";
import DataEntry from "./components/DataEntry";
import NavBar from "./components/TopBar";
import Home from "./components/home";
import NavigationBar from "./components/TopBar";

class App extends Component {
    render() {
        return (
            <div>
                <NavigationBar/>
            </div>
        );
    }
}

export default App;
