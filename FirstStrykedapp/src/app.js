import React, { Component } from "react";
import getWeb3 from "./utils/getWeb3";
import initBlockchain from "./utils/initBlockchain";
import getPatientsCount from "./utils/getPatientsCount";


import { HashRouter, Route } from "react-router-dom";
import { Container } from "semantic-ui-react";
import { Provider } from "react-redux";


import TopBar from "./components/TopBar";
import home from "./pages/home";
import DataEntry from "./pages/DataEntry";



// import Homepage from "./pages/home";
// import Data from "./pages/DataEntry";

import store from "./redux/store";



class App extends Component {



  componentDidMount = async () => {
    try {
      const web3 = await getWeb3(); // from utils directory;  connect to metamask
      const data = await initBlockchain(web3);  // get contract instance and user address
      await getPatientCount(data.CZ, data.virus);  // get user count and total count of getpatients

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
            <TopBar state={this.state} />
            <div>
              //back to this agian

              <Route exact path="/home" component={home} />
              <Route exact path="/DataEntry" component={DataEntry} />

            </div>
          </Container>
        </HashRouter>
      </Provider>
    );
  }
}

export default App;
