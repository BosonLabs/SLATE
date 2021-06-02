import React, { Component } from 'react';    
// Message Component   
function Message(props)   
{   
    if (props.isLoggedIn)   
        return <h1>Welcome Back!!!</h1>;   
    else  
        return <h1>Please Login First!!!</h1>;   
}   
// Login Component   
function Login(props)   
{   
   return(   
           <button onClick = {props.clickInfo}> Login </button>   
       );   
}    
// Logout Component   
function Logout(props)   
{   
    return(   
           <button onClick = {props.clickInfo}> Logout </button>   
       );   
}   
class App extends Component{    
   constructor(props)   
    {   
        super(props);    
        this.handleLogin = this.handleLogin.bind(this);  
          this.handleLogout = this.handleLogout.bind(this);   
      this.state = {isLoggedIn : false};   
    }   
   handleLogin()   
    {   
        this.setState({isLoggedIn : true});   
    }   
    handleLogout()   
    {   
        this.setState({isLoggedIn : false});   
    }   
    render(){   
        return(   
            <div>   
        <h1> Conditional Rendering Example </h1>  
                <Message isLoggedIn = {this.state.isLoggedIn}/>               
                {   
                    (this.state.isLoggedIn)?(   
                    <Logout clickInfo = {this.handleLogout} />   
                    ) : (   
                    <Login clickInfo = {this.handleLogin} />   
                    )   
                }   
            </div>         
            );   
    }   
}   
export default App;