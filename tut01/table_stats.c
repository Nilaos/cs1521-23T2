
#include <stdio.h>

#define NUM_PEOPLE 42 // TODO: Correct this! Or add more friends!
#define MAX_NAME_LEN 101

// A basic program that will print out some statistics about your table!
// Fill it in together to complete it, and get to know people too!
int main(int argc, char *argv[])
{
    if (NUM_PEOPLE > 20)
    {
        printf("I doubt your table is that big!\n");
        return 1;
    }

    // Array of people's names
    char people[NUM_PEOPLE][MAX_NAME_LEN];

    // TODO: Read in the first name of everyone at the table, separated by newlines
    // i.e.:
    // Josh
    // Sarah
    // Kim
    // Hint: A loop may help for this...
    scanf("%100s", people[0]);

    // Advanced: The above scanf has a 100 in it. What security risk does this limit?

    int years[NUM_PEOPLE];
    int year_sum = 0;
    for (int j = 0; i < NUM_PEOPLE; i++)
    {
        printf("What year is %s in? ", people[i]);
        scanf(/* TODO: Read in what year each person is in! */);
        year_sum += years[i];
    }

    int average_year = (int)year_sum / (int)NUM_PEOPLE;
    // TODO: Calculate this properly! Should the type and type-cast be a different type?
    printf("The average year of our table is %lf\n", average_year);

    printf("We're looking forwards to COMP1521 this term!\n");
}