#include <stdio.h>
#include <stdbool.h>
#include "student.h"

const int MAJOR_CS = 0;
const int MAJOR_OPTOMETRY = 1;
const int MAJOR_TRUMPET = 2;



// more_senior(s1, s2) figures out which of students *s1 and *s2 is more senior
//                     based on their number of completed_terms
//   PRE: s1, s2 are valid pointers to student structs
//        students *s1 and *s2 have different student ids
//   POST: returns a pointer to a student with more seniority
//         if their number of completed terms is the same then
//         return a pointer to a student with the smaller student_id
struct student * more_senior(struct student* s1, struct student* s2){
    const int y_s1 = s1->student_id / 100000;
    const int y_s2 = s2->student_id / 100000;
    if (y_s1<y_s2){
        return &s1;
    } else if (y_s2<y_s1){
        return &s2;
    } else if (s1->student_id < s2->student_id) {
        return &s1;
    } else {
        return &s2;
    }
}
       

// is_same_student(s1, s2) checks whether two distinct student records belong to the same student
//                         based on their student_id
//   PRE: s1, s2 are valid pointers to student structs
//   POST: returns true, if two records belong to the same student, and false otherwise
bool is_same_student(const struct student *s1, const struct student* s2){
    return (s1->student_id == s2->student_id);
}

// print_student_info(s) pretty prints student's information
//   PRE: s is a valid pointer to a student struct
//   POST: outputs student's information as shown below (omitting leading '//' and whitespace characters)
//        Note: you will have to lookup printf formatting options (placeholders) in the textbook
//
//        ********************
//        Student ID: 20550011
//        Balance:       45000
//        Major:       TRUMPET [/CS/OPTOMETRY]
//        Completed terms:   8
//        Graduating:      YES [/NO]
//        ********************
//
void print_student_info(const struct student* s){
    printf("\n********************\n");
    printf ("Student ID: %d\n", s->student_id);
    printf ("Balance:");
    printf("%12d\n", s->remaining_fees);
    if (s->major == MAJOR_CS){
        printf("Major:            CS\n");
    } else if (s->major == MAJOR_OPTOMETRY) {
        printf("Major:     OPTOMETRY\n");
    } else {
        printf("Major:       TRUMPET\n");
    }
    printf("Completed terms:   %d\n", s->completed_terms);
    if (s->graduating == true){
        printf("Graduating:      YES\n");
    } else {
        printf("Graduating:       NO\n");
    }
    printf("********************\n");
}

// pay_fees(s, amount) will reduce the student [*s]'s fees by amount
//   PRE: amount > 0, s is a valid pointer to a student struct
//   POST: student's remaining_fees will be reduced by amount
//         if amount > (original) remaining fees, remaining_fees should be set to 0 (university takes the rest)
//         if (original) remaining_fees > amount, a penalty of $100 is applied to the student's account
//         a message info about new balance should be output:
//         "New balance for student with id <id>: <balance>\n"
void pay_fees(struct student *s, int amount){;
    if (amount >= s->remaining_fees){
        s->remaining_fees = 0;
    } else {
        s->remaining_fees = s->remaining_fees - amount + 100;
    }
}

// proceed_to_next_term(s) will update student's information about completed terms, fees, and graduating
//  PRE: s is a valid pointer to a student struct
//  POST: If current fees are > 0, then the function should only output:
//        "The student with id <id> cannot proceed to the next term. Reason: outstanding balance.\n"
//        Otherwise, student's fees are increased by 5000, if they are in MAJOR_CS
//                                                   4500, if they are in MAJOR_OPTOMETRY, and
//                                                      2, if they are in MAJOR_TRUMPET
//        completed_terms is incremented by 1, and the field graduating is updated if necessary
void proceed_to_next_term(struct student *s){
    if (s->remaining_fees > 0){
        printf("The student with id %d cannot proceed to the next term. Reason: outstanding balance.\n", s->student_id);
    } else {
        s->completed_terms = s->completed_terms + 1;
        if (s->completed_terms >=8){
            s->graduating = true;
        } else  if (s->major == 0) {
            s->remaining_fees = s->remaining_fees + 5000;
        } else if (s->major == 1) {
            s->remaining_fees = s->remaining_fees + 4500;
        } else if (s->major == 2) {
            s->remaining_fees = s->remaining_fees + 2;
        }
    }
}

