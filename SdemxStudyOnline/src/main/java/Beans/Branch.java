package Beans;

import Models.CategoryModel;

import java.util.List;

public class Branch {
    int branchID;
    String branchName;
    List<Category> lstCategory;
    int numRegister;

    public Branch() {
    }

    public Branch(int branchID, String branchName, List<Category> lstCategory) {
        this.branchID = branchID;
        this.branchName = branchName;
        this.lstCategory = lstCategory;
    }

    public Branch(int branchID, String branchName, int numRegister) {
        this.branchID = branchID;
        this.branchName = branchName;
        this.numRegister = numRegister;
    }

    public int getBranchID() {
        return branchID;
    }

    public void setBranchID(int branchID) {
        this.branchID = branchID;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public List<Category> getLstCategory() {
        return CategoryModel.getCategoryWithBranchID(this.branchID);
    }

    public void setLstCategory(List<Category> lstCategory) {
        this.lstCategory = lstCategory;
    }

    public int getNumRegister() {
        return numRegister;
    }

    public void setNumRegister(int numRegister) {
        this.numRegister = numRegister;
    }
}
