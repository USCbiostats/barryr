# barry 0.2.2

* Fixed catastrophic hash collisions in `FreqTable::make_hash` and `vecHasher`:
  hashes of small-integer statistics had no entropy in their low bits, so
  `std::unordered_map` placed (nearly) all keys in a single bucket, making
  support computation O(4^ncol) instead of O(2^ncol). Models with many
  response columns (e.g., 16) appeared to hang during initialization
  (USCbiostats/barry#24).

* `FreqTable::add()` now verifies the stored row on a hash hit and keeps
  true 64-bit hash collisions in a per-hash overflow chain, so distinct
  statistics can no longer be silently merged (USCbiostats/barry#24).


# barry 0.2.1

* Initial CRAN submission. The package follows `barry`'s versioning.

