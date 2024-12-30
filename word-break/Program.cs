class Solution
{
    static void Main(string[] args)
    {
        string s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab";
        IList<string> wordDict = ["a", "aa", "aaa", "aaaa", "aaaaa", "aaaaaa", "aaaaaaa", "aaaaaaaa", "aaaaaaaaa", "aaaaaaaaaa"];
        var outputs = WordBreak(s, wordDict);
        Console.WriteLine(outputs);
    }

    static HashSet<String> hs = new HashSet<String>();


    static bool WordBreak(string s, IList<string> wordDict)
    {
        if (hs.Contains(s))
        {
            return false;
        }
        if (s.Equals(""))
        {
            return true;
        }
        foreach (string word in wordDict)
        {
            if (s.StartsWith(word))
            {
                string subString = s.Substring(word.Length);
                bool hasSubString = WordBreak(subString, wordDict);
                if (hasSubString)
                {
                    return true;
                }
            }
        }
        hs.Add(s);
        return false;
    }

}