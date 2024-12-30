class Solution {
  bool canJump(List<int> nums) {
    if(nums.length == 1){
      return true;
    }

    int pointer = 0;
    for(int i =0; i < nums.length; i ++ ){
      int number = nums[i];
       if(pointer>= nums.length - 1){
        return true;
      }

      if( number == 0 &&  i == pointer){
        return false; 
      }

      if(number + i > pointer){
        pointer = number + i;
      }
    }
    return true;    
  }
}

main() {
  Solution sol = Solution();
  print(sol.canJump([3,2,1,0,4]));
}
