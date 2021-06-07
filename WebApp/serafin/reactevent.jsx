import React, { Component } from 'react';  
class App extends React.Component {  
    constructor(props) {  
        super(props);  
        this.state = {  
            companyName: ''  
        };  
    }  
    changeText(event) {  
        this.setState({  
            companyName: event.target.value  
        });  
    }  
    render() {  
        return (  
            <div>  
                <h2>Simple Event Example</h2>  
                <label htmlFor="name">Enter company name: </label>  
                <input type="text" id="companyName" onChange={this.changeText.bind(this)}/>  
                <h4>You entered: { this.state.companyName }</h4>  
            </div>  
        );  
    }  
}  
export default App;