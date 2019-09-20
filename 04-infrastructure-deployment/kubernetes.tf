provider "kubernetes" {
  host                   = "${azurerm_kubernetes_cluster.aks_cluster.kube_admin_config.0.host}"
  username               = "${azurerm_kubernetes_cluster.aks_cluster.kube_admin_config.0.username}"
  password               = "${azurerm_kubernetes_cluster.aks_cluster.kube_admin_config.0.password}"
  client_certificate     = "${base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_admin_config.0.client_certificate)}"
  client_key             = "${base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_admin_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_admin_config.0.cluster_ca_certificate)}"
}

resource "kubernetes_cluster_role_binding" "cluster_admin_group_role_binding" {
    metadata {
        name = "cluster-admin-group"
    }
    role_ref {
        api_group = "rbac.authorization.k8s.io"
        kind = "ClusterRole"
        name = "cluster-admin"
    }
    subject {
        kind = "Group"
        name = "${var.cluster_admin_group_id}"
        api_group = "rbac.authorization.k8s.io"
    }
}

resource "kubernetes_service_account" "tiller_service_account" {
  metadata {
    name = "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_cluster_role_binding" "cluster_admin_tiller_role_binding" {
    metadata {
        name = "cluster-admin-tiller"
    }
    role_ref {
        api_group = "rbac.authorization.k8s.io"
        kind = "ClusterRole"
        name = "cluster-admin"
    }
    subject {
        kind = "ServiceAccount"
        name = "tiller"
        namespace = "kube-system"
    }
}

resource "kubernetes_secret" "terraform_secret" {
  metadata {
    name = "terraform-secret"
  }
  data  {
    "DATABASE_USER"     = "dbuser"
    "DATABASE_PASSWORD" = "dbpassword"
    "DATABASE_URL"      = "dburl"
  }
}
