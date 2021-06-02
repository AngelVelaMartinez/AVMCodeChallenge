/*-------------------------------------------------------------------------------------------------
Version: 			1.0
Created date: 		01/06/2021
Created by: 		Ángel Vela (avelamar@hotmail.es)
Last change date: 	01/06/2021
Last change by: 	Ángel Vela (avelamar@hotmail.es)
Function: 			Class which counts the using each word in a large string, as a text
-------------------------------------------------------------------------------------------------*/
public class AC_WordMeter {
	
    public map<String,Integer> wordMeter (String inputText){
        //Remove all special characters for avoiding counting errors in existing words 
        List<String> specialChars = new List<String>{'~','`','!','#','$','%','^','*','(',')','_','+','=',':',',','.','?','¿','¡',';'};
        for(String c : specialChars){
            if(inputText.contains(c)){
                inputText = inputText.replace(c, '');
            }
        }
        //Replace some special characters using his meanings. Dash isn't removed because this algorithm count complex word. 
        if(inputText.contains('&')){
            inputText = inputText.replace('&', 'and');
        }
        if(inputText.contains('—')){
            inputText = inputText.replace('—', ' ');
        }
        //Split by space all text to get the list of words and process it in a loop to build a custom map with the using count.
        List<String> wordList = inputText.toLowerCase().split(' ');
        Map<String,Integer> wordCount = new Map<String,Integer>();
        for(String s : wordList){
            if (wordCount.containsKey(s)) {
                wordCount.put(s,wordCount.get(s)+1);
            } else {
                wordCount.put(s,1);
            }
        }
        return wordCount;
    }
}