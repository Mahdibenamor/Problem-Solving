class Solution
{
    static void Main(string[] args)
    {
        int[] nums = [3, 30, 34, 5, 9];
        string result = LargestNumber(nums);
        Console.WriteLine(result);
    }
    

    static public string LargestNumber(int[] nums)
    {
        string result = string.Empty;
        List<string> numsStr = new List<string>();
        foreach (int num in nums)
        {
            numsStr.Add(num.ToString());
        }

        while(numsStr.Count > 0)
        {
            string max = numsStr.First();
            foreach (string numStr in numsStr)
            {
              max = getLarge(max, numStr);
            }
            result = result + max;
            numsStr.Remove(max);
        }

        return result;
    }

    static public string getLarge(string num1, string num2)
    {
        string copyNum1 = num1;
        string copyNum2 = num2;
        // num1 = 53 num2= 5
        if (num1 == num2)
            return copyNum1;
        while(num1 != "" && num2 != "")
        {
            if (num1[0] > num2[0])
            {
                return copyNum1;
            }
            if (num2[0] > num1[0])
            {
                return copyNum2;
            }
            if(num2[0] == num1[0])
            {
                num1 = num1.Substring(1);
                num2 = num2.Substring(1);
            }
        }
        if(num2 == "")
        {
            return copyNum2;
        }
        if (num1 == "")
        {
            return copyNum1;
        }
        return copyNum1;
    }


}