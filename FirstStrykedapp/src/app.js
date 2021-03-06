import React, { Component } from "react";
import getWeb3 from "./utils/getWeb3";
import initBlockchain from "./utils/initBlockchain";
import getPatientCount from "./utils/getPatientsCount";


import { HashRouter, Route } from "react-router-dom";
import { Container } from "semantic-ui-react";
import { Provider } from "react-redux";

import NavigationBar from "./components/TopBar";
import Home from "./components/home";
import DataEntry from "./components/DataEntry";
import store from "./redux/store";
import getRecords from "./utils/getRecords";


class App extends Component {



  componentDidMount = async () => {
    try {
      const web3 = await getWeb3();
      const data = await initBlockchain(web3);
      await getRecords(data.FS);
    } catch (error) {
      // Catch any errors for any of the above operations.
      alert(
          `Failed to load web3, accounts, or contract. Check console for details.`
      );

      console.log(error);
    }
  };

  render() {
    return (
      <Provider store={store}>
        <HashRouter>
          <Container>
            <NavigationBar state={this.state} />
            <div>

            </div>
          </Container>
        </HashRouter>
      </Provider>
    );
  }
}

export default App;
