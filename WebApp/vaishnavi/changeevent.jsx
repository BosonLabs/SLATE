import React, { Component } from "react";
import ReactDOM from "react-dom";

class ChangeInput extends Component {
    constructor(props) {
      super(props);
      this.state = {
        name: ""
      };
    }

    changeText(event) {
      this.setState({
      name: event.target.value
    });
  }

  render() {
     return (
       <div>
         <label htmlFor="name">Enter Text here </label>
         <input type="text" id="name" onChange={this.changeText.bind(this)} />
         <h3>{this.state.name}</h3>
       </div>
     );
  }
}

export default ChangeInput;

//if change input as an alert
//import React, { Component } from "react";
//import ReactDOM from "react-dom";

//class ShowAlert extends Component {
 // showAlert() {
 //   alert("I'm an alert");
  //}

 // render() {
  //  return <button onClick={this.showAlert}>show alert</button>;
  //}
//}
//export default ShowAlert;