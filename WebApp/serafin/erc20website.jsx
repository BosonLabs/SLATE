import React, { Component } from 'react';
import web3 from './web3';
import token from './token';
class App extends Component {
 constructor(props) {
   super(props);

   this.state = { 
     name: '',
     symbol: '',
     _totalSupply: '',
     decimals: ''
  };
 }
async componentDidMount() {
  const name = await token.methods.name().call();
  this.setState({ name });
  const symbol = await token.methods.symbol().call();
  this.setState({ symbol });
  const _totalSupply = await token.methods._totalSupply().call();
  this.setState({ _totalSupply });
  const decimals = await token.methods.decimals().call();
  this.setState({ decimals });
  }
 render() {
    return (
      <div>
       <h1>ERC20 Token</h1><br></br>
       <h3>  name : {this.state.name} </h3>
       <h3>  symbol : {this.state.symbol}</h3>
       <h3>  _totalSupply : {this.state._totalSupply}</h3>
       <h3>  decimals : {this.state.decimals}</h3>
      </div>
    );
  }
}
export default App;