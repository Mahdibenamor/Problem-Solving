using System.Collections.Generic;
class Solution
{
    static void Main(string[] args)
    {
        string[] inputs = ["eat", "tea", "tan", "ate", "nat", "bat"];
        var outputs = groupAnagrams(inputs);
        Console.WriteLine();
    }


    static IList<IList<string>> groupAnagrams(string[] strs)
    {
        Dictionary<string, IList<string>> dict = new Dictionary<string, IList<string>>();
        foreach (string str in strs)
        {
            string sortedString = string.Concat(str.Order());
            if (dict.ContainsKey(sortedString))
            {
                dict[sortedString].Add(str);
            }
            else
            {
                dict[sortedString] = [str];
            }

        }
        IList<IList<string>> result = new List<IList<string>>(dict.Values);
        return result;
    }


    static bool isAnnagrams(String str1,String str2)
    {
        if(str1.Length != str2.Length)
        {
            return false;
        }
        else
        {
            str2 = String.Concat(str2.Order());
            str1 = String.Concat(str1.Order());
            if (str1 == str2) return true;
            else return false;
        }
    }
}