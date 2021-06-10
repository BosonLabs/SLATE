import React, { Component } from 'react';  
class App extends React.Component {  
constructor(props) {  
super(props);  
this.state = {  
StudName: ''  
};  
}  
changeText(event) {  
this.setState({  
StudName: event.target.value  
});  
}  
render() {  
return (  
<div>  
<h2>Event</h2>  
<label htmlFor="name">Student name: </label>  
<input type="text" id="StudName" onChange={this.changeText.bind(this)}/>  
<h4>Entered name: { this.state.StudName }</h4>  
</div>  
);  
}  
}  
export default App;