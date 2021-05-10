import React from 'react';
import ReactDOM from 'react-dom';
class Form extends React.Component {
  constructor(props) {
    super(props);
    this.state = {name: ''};

    this.UpdateName = this.UpdateName.bind(this);
    this.formSubmit = this.formSubmit.bind(this);
  }

  UpdateName(event) {
    this.setState({name: event.target.value});
  }
  
  formSubmit(event) {
    alert("The name entered is: "+ this.state.name);
  }

  render() {
    return (
      <form>        
         Enter Your Name:<input type="text" value={this.state.name} onChange={this.UpdateName} /><br/>        
        <h2>{this.state.name}</h2>
        <input type="submit" value="Submit" onClick={this.formSubmit} />
      </form>
    );
  }
}

export default Form;