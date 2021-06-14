import React from 'react'; 
import ReactDOM from 'react-dom'; 
  
// Example Component 
function Example(props) 
{ 
    if(!props.toDisplay) 
        return null; 
    else
        return <h1>Component is rendered</h1>; 
} 
  
ReactDOM.render( 
    <div> 
        <Example toDisplay = {true} /> 
        <Example toDisplay = {false} /> 
    </div>,  
    document.getElementById('root') 
); 