import React, { Component } from "react";
import getWeb3 from "./utils/getWeb3";
import initBlockchain from "./utils/initBlockchain";


export default App;
import TopBar from "./components/TopBar";

import Homepage from "./components/homepage";
import DataEntry from "./components/DataEntry";
import FileUpload from "./components/FileUpload";

import store from "./redux/store";


class App extends Component {



  componentDidMount = async () => {
    try {
      const web3 = await getWeb3(); // from utils directory;  connect to metamask
      const data = await initBlockchain(web3);  // get contract instance and user address
      await getpatientsCount(data.CZ, data.virus);  // get user count and total count of zombies
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

              <Route exact path="/DataEntry" component={DataEntry} />
              <Route exact path="/FileUpload" component={FileUpload} />
              <Route exact path="/home" component={home} />
              // <Route exact path="/radio" component={radio} />
              // <Route exact path="/select" component={textinput} />
              // <Route exact path="/validation" component={validation} />
            </div>
          </Container>
        </HashRouter>
      </Provider>
    );
  }
}

export default App;


}
