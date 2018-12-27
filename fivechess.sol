pragma solidity ^0.5.2;

contract fivechess{

    address public owner;
    address public target;

    mapping(address=>bool) can;

    int[15][15] p;

    constructor() public {
        for(uint i=0;i<15;i++){
            for(uint j=0;j<15;j++){
                p[i][j]=0;
            }
        }
        owner = msg.sender;
        target = msg.sender;
        can[owner]=true;
    }

    function addgame() public {
        require(owner==target);
        require(msg.sender!=owner);
        target=msg.sender;
        can[target]=false;
    }

    function play(uint x, uint y) public returns (int){
        require(owner!=target);
        require(p[x][y]==0);
        if(msg.sender==owner){
            require(can[owner]==true);
            p[x][y]=1;
            can[owner]=false;
            can[target]=true;

            if(_isWin(x,y,1)==true){
                can[owner]=false;
                can[target]=false;
                return 1;
            }
        }
        if(msg.sender==target){
            require(can[target]==true);
            p[x][y]=-1;
            can[owner]=true;
            can[target]=false;
            if(_isWin(x,y,-1)==true){
                can[owner]=false;
                can[target]=false;
                return -1;
            }
        }
        return 0;
    }

    function set() public returns (int){
        if(msg.sender==owner){
            can[owner]=false;
            can[target]=false;
            return 1;
        }
        if(msg.sender==target){
            can[owner]=false;
            can[target]=false;
            return -1;
        }
        return 0;
    }

    function _isWin(uint x, uint y, int n)private view returns (bool){
       int dir=1;
       uint i=1;
       uint flag=1;
       while(flag<=5){
           if(dir==1){
               if((x-i)>=0&&p[x-i][y]==n){
                  i++;
                  flag++;
               }
               else{
                   i=1;
                   dir=-1;
               }
           }else{
               if((x+i)<14&&p[x+i][y]==n){
                   i++;
                   flag++;
               }
               else{
                   break;
               }
           }
       }
       if(flag==5){
           return true;
       }else{
           i=1;
           dir=1;
       }
       while(flag<=5){
           if(dir==1){
               if((y-i)>=0&&p[x][y-i]==n){
                  i++;
                  flag++;
               }
               else{
                   i=1;
                   dir=-1;
               }
           }else{
               if((y+i)<14&&p[x][y+i]==n){
                   i++;
                   flag++;
               }
               else{
                   break;
               }
           }
       }
       if(flag==5){
           return true;
       }else{
           i=1;
           dir=1;
       }
       while(flag<=5){
           if(dir==1){
               if((y-i)>=0&&(x-i)>=0&&p[x-i][y-i]==n){
                  i++;
                  flag++;
               }
               else{
                   i=1;
                   dir=-1;
               }
           }else{
               if((y+i)<=14&&(x+i)<=14&&p[x+i][y+i]==n){
                   i++;
                   flag++;
               }
               else{
                   break;
               }
           }
       }
       if(flag==5){
           return true;
       }else{
           i=1;
           dir=1;
       }
       while(flag<=5){
           if(dir==1){
               if((y-i)>=0&&(x+i)<=14&&p[x+i][y-i]==n){
                  i++;
                  flag++;
               }
               else{
                   i=1;
                   dir=-1;
               }
           }else{
               if((y+i)<=14&&(x-i)>=0&&p[x-i][y+i]==n){
                   i++;
                   flag++;
               }
               else{
                   break;
               }
           }
       }
       if(flag==5){
           return true;
       }else{
           return false;
       }
    }

}