import React, { Component } from "react";

class Greeting extends Component {
  render() {
    const imgStyle = {
      display: "block",
      marginLeft: "auto",
      marginRight: "auto",
      width: "50%"
    };

    return (
      <div>
        <br />
        <h2 style={{ color: "DarkRed", textAlign: "center" }}>
          {" "}
          Welcome to the   <b> Stryke</b> Dapp!
        </h2>
        <br />
        <img src="static/images/Homepage.png" style={imgStyle} width="400px" alt="Zombie rising from grave" />
        <br /> <br />
        <p style={{ textAlign: "center" }}>

          <br />
          <br />
          <br /> <br />
        </p>
      </div>
    );
  }
}

export default Greeting;
