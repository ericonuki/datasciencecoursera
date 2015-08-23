# Getting and Cleaning data Project
## How it works:
When you run the script, it assumes you're in the root directory where the data was extracted.
It creates a separate environment, removing itself after it finishes, leaving behind the 5 answers as
* answer1
* answer2
* answer3
* answer4
* answer5

The variables are pretty self explanatories, and since it is a very straightforward assignment where each step leads to another, no obscure variables were created.
One mention to the closure utilized to get the activity name, it doesn't run multiple times, since it is evaluated when local is called.
As per answers 3 and 4, I had already named the Activities and the other columns, so no work had to be done here.
For answer 5, I know it was not explained in the Course, but it is nice to know that there is a function called summarise_each in dplyr package that does most of the work for this part.