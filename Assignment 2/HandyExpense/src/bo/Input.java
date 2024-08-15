/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import entity.Expense;
import utils.Validation;

/**
 *
 * @author ADMIN
 */
public class Input {

    private final Expense expense;
//    private String regex = "[AĂÂBCDĐEÊGHIKLMNOÔPQRSTUƯVXY-ÁÀẢÃẠẰẲẴẶÉÈẺẼẸẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌỐỒỖỔỘỚỜỞỠỢÚÙỦŨỤỨỪỬỮỰaăâbcdđeêghiklmnoôpqrstuưxy-áàảãạằẳẵặéèẻẽẹếềểễệíìỉĩịóòỏõọốồổỗộớờởỡợúùủũụứừửữự0-9 ]+";

    public Input() {
        this.expense = new Expense();
    }

    public Expense getExpense() {
        expense.setDate(Validation.getDate("Nhập ngày (dd/MM/yyyy): "));
        expense.setMoney(Validation.getDouble("Nhập tiền: ", "Chỉ nhập số thực!", 0, Double.MAX_VALUE));
        expense.setContent(Validation.getStringByRegex("Nhập tên đồ vừa mua: ", ".+", ""));
        return expense;
    }

    public String getName() {
        String name = Validation.getStringByRegex("Nhập tên: ", ".+", "Tên đồ vật không chứa các ký tự đặc biệt");
        return name;
    }

    public double getAmount() {
        double amount = Validation.getDouble("Giá: ", "Chỉ được chứa các ký tự số!", 0, Double.MAX_VALUE);
        return amount;
    }

    public String getDate() {
        String date = Validation.getDate("Ngày mua: ");
        return date;
    }
}
