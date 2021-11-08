#/bin/bash
# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ======= SUMMARY OF POKEMON.DAT ======
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ======= END SUMMARY =======

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script.
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

awk 'BEGIN{FS="\t"}
{
        if (NR!=1)
        {
                #Counts the number of pokemon(including megas)/hp/atk in the file
                pokemon+=1
                hp+=1
                atk+=1

                #Adds total hp value for all pokemon
                hpTot+=$5


                #Adds total atk value for all pokemon
                totAtk+=$6
        }
}
END{
        print "===== SUMMARY OF POKEMON.DAT ====="
        print "\tTotal Pokemon:", pokemon
        print "\tThe Avg HP is", hpTot/hp
        print "\tAvg. Attack:", totAtk/atk
        print "===== END SUMMARY ====="
}' $1 #takes the first file input in the command line
