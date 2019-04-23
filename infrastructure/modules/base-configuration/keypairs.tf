resource "openstack_compute_keypair_v2" "rnurgaliyev" {
  name       = "rnurgaliyev"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzBd/ZXus0RGHqi6TdfLQcZML4b+woARlbV/+V9bsvdXKbe7FVLhd2oYV5n5kBI4DfEtD0J5BXBXbzG1BW9WmB/Ty2wlwUu+NFDCn+3kDTGov9Wlo5bfkPD/KDi/UNOqJvOMoCGzkCK04Di0ykG38gLKeOUDtLbh/s9Manr9vDguvtBV4UE7/kNQFzGFffB3ZyvKVzikrsm5Ri3knjCRwppN6BGZVMowTmhDgczyS3CJekdCBrgXu3eePuWbFnPVmSAapl775ouCLGAW0KsiSc9T4iTdpAMFxtvA5Pbciv4FDOfEf8w1t5xgko3KAPMLz37b7mqmRhQTwkW3BNaiZqLTC2RqZkHI5a6u655I1SJYZbJT2F/Ys8WaKTSdGLxRJ+rcV8YV0FveP6fa97gpqp6UmstGE7QsRaXPc9OG3U0hCTPYFlJ9QJ95FQMGQMt3/qsZHGWSI3H8jLn8Pqeky+XZA0Xq7cJq9n5gGpMVH2UgRT1WzbCAYiDMiNtzIxBXg5xVCzkhN98S7p+IxOpw6BsByOrIogo5lyC/qVS6tD5XCsAtOFk0ldhB/FuuyOrR1pSq3GZCyuiXkXWrwuSw7k5a7pkh3+E+t2pqYWgLFAaClNA0TI4UFfNnkgEfozop5UWuvNkbd98ruBHaGrQ0ASqWk4nEztHxUeJ/NkQ+n5uw=="
}

resource "openstack_compute_keypair_v2" "luna" {
  name       = "luna"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLOH1KvssMlw6fMGO9XGfq+fiPjQkyBnXM5fVcBuHuAMRMxJNomdNpjps0gjypA3RNFgdoTi2fDSa7oG2k2fCLPCFbcXArOw7hgffHXaGlZmJzOxL8TtZrkwKo4z1UEunmaJ5gHAXTrl8KH+dmq0mrZYsit0SIouast5FDDF6kCASzgxr0Jz4gfwKBH03tBvDiSSpmMg1VgF6EFJwtGYk6JHt0lgYbj9RkBDhl3zyDL67YZuBfuCR5JXpAOKjXEtTZdfezFIqhH/iCCreDPct4I78p0sRUaduSmh/hL0UJ4tC2NoDuMfoIXJqwsFSRcgslh/UmQEY2TgoFcjKvS69Z"
}

output "keypair_name" {
  value = "${openstack_compute_keypair_v2.rnurgaliyev.name}"
}
