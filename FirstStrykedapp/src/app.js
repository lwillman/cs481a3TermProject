
import React, { Component } from "react";
import getWeb3 from "./utils/getWeb3";
import initBlockchain from "./utils/initBlockchain";
import getPatientCounte from "./utils/getPatientCounteCount";

import { HashRouter, Route } from "react-router-dom";
import { Container } from "semantic-ui-react";
import { Provider } from "react-redux";
class App extends Component {

//import components
import Home from "./components/home";
import FileUpload from "./components/FileUpload";
import editable from "./components/editable";



componentDidMount = async () => {
  try {
    const web3 = await getWeb3();
    const data = await initBlockchain(web3);
    await getPatientCounte(data.CZ, data.virus);
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
              <Route exact path="/" component={Greeting} />
              <Route
                exact
                path="/myZombieInventory"
                component={MyZombieInventory}
              />
              <Route
                exact
                path="/ZombieInventory"
                component={ZombieInventory}
              />
              {/* routes used in zombie action modal */}
              <Route exact path="/AttackZombie" component={AttackZombie} />
              <Route exact path="/FeedOnKitty" component={FeedOnKitty} />
              <Route exact path="/ChangeName" component={ChangeName} />
              <Route exact path="/LevelUp" component={LevelUp} />
              <Route exact path="/TransferZombie" component={TransferZombie} />
            </div>
          </Container>
        </HashRouter>
      </Provider>
    );
  }
}

export default App;

}
