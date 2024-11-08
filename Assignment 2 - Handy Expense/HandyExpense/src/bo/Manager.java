/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import entity.Expense;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author ADMIN
 */
public class Manager {

    private ArrayList<Expense> list;
    private Expense expense;
    private static int count;

    public Manager() {
        this.expense = new Expense();
        list = new ArrayList<>();
    }

    public Manager(int max) {
        Manager.count = max;
    }

    public ArrayList<Expense> getList() {
        sort();
        return list;
    }

    public void setList(ArrayList<Expense> list) {
        this.list = list;
    }

    public void addToList(Expense ex) {
        ex.setId(++count);
        list.add(ex);
    }

    public void deleteExpense(int id) throws Exception {
        int index = getExpenseIndex(id);
        if (index == -1) {
            throw new Exception("There is no expense that has this id");
        }
        updateAfterDelete(list.get(index));
        list.remove(index);
        setLastID();
    }

    public int calcSummaryOfExpense() {
        int sum = 0;
        for (Expense expense : list) {
            sum += expense.getMoney();
        }
        return sum;
    }

    public ArrayList<Expense> searchExpense(String string) {
        ArrayList<Expense> list1 = new ArrayList<>();
        double number = 0;
        if (string.matches("[0-9]*\\.?[0-9]+") || string.matches("[0-9]*\\,?[0-9]+")) {
            number = Double.parseDouble(string);
        }
        for (Expense expense : list) {
            if (expense.getDate().equalsIgnoreCase(string)
                    || expense.getContent().contains(string)
                    || expense.getMoney() == number) {
                list1.add(expense);
            }
        }
        return list1;
    }

    public void updateName(Expense expense, String name) {
        expense.setContent(name);
        this.expense = expense;
        updateList(expense);
    }

    public void updatePrice(Expense expense, double price) {
        expense.setMoney(price);
        this.expense = expense;
        updateList(expense);
    }

    public void updateDate(Expense expense, String date) {
        expense.setDate(date);
        this.expense = expense;
        updateList(expense);
    }

    private void updateList(Expense expense) {
        for (Expense ex : list) {
            if (ex == expense) {
                list.set(list.indexOf(ex), expense);
            }
        }
    }

    public Expense getExpense(int id) {
        for (Expense ex : list) {
            if (ex.getId() == id) {
                return ex;
            }
        }
        return null;
    }

    private void updateAfterDelete(Expense expense) {
        list.stream().filter((ex) -> (ex.getId() > expense.getId())).forEachOrdered((ex) -> {
            ex.setId(ex.getId() - 1);
        });
    }

    private void updateAfterSort() {
        count = 0;
        for (Expense expense : list) {
            expense.setId(++count);
        }
    }

    private void setLastID() {
        count = 0;
        list.forEach((_item) -> {
            ++count;
        });
    }

    private void sort() {
        for (int i = 0; i < list.size(); i++) {
            for (int j = 0; j < list.size(); j++) {
                if (list.get(j).getId() == sortByDate().get(i).getId()) {
                    Expense temp = list.get(i);
                    list.set(i, list.get(j));
                    list.set(j, temp);
                }
            }
        }
        updateAfterSort();
    }

    private ArrayList<Expense> sortByDate() {
        ArrayList<Expense> list1 = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            Expense expense = list.get(i);
            String date = expense.getDate();
            date = date.replace("Jan", "01")
                    .replace("Feb", "02")
                    .replace("Mar", "03")
                    .replace("Apr", "04")
                    .replace("May", "05")
                    .replace("Jun", "06")
                    .replace("Jul", "07")
                    .replace("Aug", "08")
                    .replace("Sep", "09")
                    .replace("Oct", "10")
                    .replace("Nov", "11")
                    .replace("Dec", "12");
            Expense e1 = new Expense();
            e1.setContent(expense.getContent());
            e1.setDate(date);
            e1.setMoney(expense.getMoney());
            e1.setId(expense.getId());
            list1.add(e1);
        }
        Collections.sort(list1, new Comparator<Expense>() {
            @Override
            public int compare(Expense date1, Expense date2) {
                String[] parts1 = date1.getDate().split("/");
                String[] parts2 = date2.getDate().split("/");
                int year1 = Integer.parseInt(parts1[2]);
                int month1 = Integer.parseInt(parts1[1]);
                int day1 = Integer.parseInt(parts1[0]);
                int year2 = Integer.parseInt(parts2[2]);
                int month2 = Integer.parseInt(parts2[1]);
                int day2 = Integer.parseInt(parts2[0]);
                if (year1 != year2) {
                    return Integer.compare(year1, year2);
                } else if (month1 != month2) {
                    return Integer.compare(month1, month2);
                } else {
                    return Integer.compare(day1, day2);
                }
            }
        });
        return list1;
    }

    private int getExpenseIndex(int id) throws Exception {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }
}
