//comment: this is my first smart contract
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
1. storage 永久性存储
2. memory 暂时性存储 运行时可以修改
3. calldata 暂时性存储 运行时不能修改
4. stack
5. codes
6. logs
*/


contract HelloWorld {
    string  helloWorldStr = "Hello World"; //storage变量
    struct Info {
        string phrase;
        uint256 id; // 这里的id是本struct的成员
        address addr;

    }

    Info[] infos;
    
    function helloWorld(uint256 _id) public view returns (string memory) {
        // view 函数里没有任何的变量改变，只读取
        // uint256 a = 1+1;
        // bool boolVar1 = true;
        // int256 intVar = -1;
        // bytes32 bytesVar = "Hello World!";
        // bytes4 bytesVar1 = 'A';
        
             for(uint256 i = 0; i < infos.length; i++){
            if(infos[i].id == _id){
                addInfo(infos[i].phrase);
            }
        }
        return addInfo(helloWorldStr) ;
    }

    function setHelloWorld(string memory newString, uint256 _id) public {
        helloWorldStr = newString;
        Info memory info = Info(newString, _id, msg.sender);
        infos.push(info);
    

    }
    function addInfo(string memory helloWorldStr) internal pure returns(string memory){
        return string.concat(helloWorldStr, " from Frank's contract.");
    }

}