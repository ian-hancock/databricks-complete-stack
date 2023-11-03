module "marketing_cluster" {
    source       = "../modules/cluster"
    cluster_name = "${var.env}-marketing-cluster"
    usergroups   = ["MarketingDataUsers"]
    managegroups = ["MarketingDataStewards"]
}

module "finance_cluster" {
    source       = "../modules/cluster"
    cluster_name = "${var.env}-finance-cluster"
    usergroups   = ["FinanceDataUsers"]
    managegroups = ["FinanceDataStewards"]
}
