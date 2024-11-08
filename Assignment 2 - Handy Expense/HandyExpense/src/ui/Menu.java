/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ui;

import utils.Validation;

/**
 *
 * @author ADMIN
 */
public class Menu {

    private int choice = 0;

    public void menu() {
        String menu = "======== Handy Expense Program ========\n"
                + "1. Add an expense\n"
                + "2. Display all expenses\n"
                + "3. Delete an expense\n"
                + "4. Change information of an expense\n"
                + "5. Search\n"
                + "6. Quit";
        System.out.println(menu);
        choice = Validation.getInt("Your choice: ", "Only Number!", "Out of range!", 1, 6);
    }

    public int getInt() {
        return choice;
    }
}
