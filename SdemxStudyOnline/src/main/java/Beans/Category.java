package Beans;

import Models.CategoryModel;

public class Category {
    int catID;
    String catName;
    int branchID;

    public Category() {
    }

    public Category(int catID, String catName, int branchID) {
        this.catID = catID;
        this.catName = catName;
        this.branchID = branchID;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public int getBranchID() {
        return branchID;
    }

    public void setBranchID(int branchID) {
        this.branchID = branchID;
    }

    public String getBranchName(){
        return CategoryModel.getBranchNameByBranchID(this.branchID);
    }
}
