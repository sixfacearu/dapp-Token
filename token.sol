pragma solidity ^0.4.0;
contract token{
    mapping(address=>uint256)bank;
    mapping(address=>mapping(address=>uint256))apprve;
    
   function totalSupply(uint256 tokens) public {
       bank[msg.sender]=tokens;
   }
   function balanceOf(address who) public view returns (uint256){
      return bank[who];}
    function transfer(address to, uint256 value) public returns (bool){
        if(bank[msg.sender]>value&&value>0)
        bank[to]=value;
        bank[msg.sender]-=value;
        return true;
     
    }
    function approve(address spender, uint256 value) public returns (bool){
        if(bank[msg.sender]>value&&value>0)
        apprve[msg.sender][spender]=value;
        return true;
        
    }
    function allowance(address owner, address spender)public view returns (uint256){
        return apprve[owner][spender];
    }
    
    function transferFrom(address from, address to, uint256 value) public returns (bool){
        if(apprve[msg.sender][from]>value && value>0)
        bank[to]+=value;
        apprve[msg.sender][from]-=value;
        bank[msg.sender]-=value;
        return true;
        
    }
     function increaseApproval(address spender, uint addedValue) public returns (bool) {
         if(bank[msg.sender]>addedValue&&addedValue>0)
        apprve[msg.sender][spender]+=addedValue;
     }
     function decreaseApproval(address spender, uint subtractedValue) public returns (bool){
         if(subtractedValue<=apprve[msg.sender][spender] && subtractedValue>0)
             apprve[msg.sender][spender]-=subtractedValue;
         }
         function mint(uint value) public returns (bool){
        
             bank[msg.sender] = bank[msg.sender] + value;
         }
         
    
}
