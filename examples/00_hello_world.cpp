// [[Rcpp::depends(barry)]]

#include <Rcpp.h>
#include <barry/barry.hpp>

// [[Rcpp::export]]
Rcpp::NumericVector count_network_stats(
    size_t n,
    std::vector<size_t> source,
    std::vector<size_t> target
) {
  // Creating network 
  netcounters::Network net(n, n, source, target);
  net.set_data(new netcounters::NetworkData, true);
  
  // Creating counter object
  netcounters::NetStatsCounter<> counter(&net);
  
  // Adding statistics to count
  netcounters::counter_edges(counter.get_counters());
  netcounters::counter_mutual(counter.get_counters());
  netcounters::counter_ttriads(counter.get_counters());
  
  // Count and return
  std::vector<double> counts = counter.count_all();
  return Rcpp::wrap(counts);
}

/*** R
# Example usage
n <- 5
source <- c(0, 1, 2, 3, 0, 2)
target <- c(1, 2, 3, 4, 2, 0)
count_network_stats(n, source, target)
*/