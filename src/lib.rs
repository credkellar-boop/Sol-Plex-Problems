use rayon::prelude::*;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Debug)]
pub struct SystemNode {
    pub id: String,
    pub entropy_weight: f64,
    pub dependencies: usize,
}

/// A high-performance heuristic evaluator for Complex system matrices.
/// Leverages Rayon to process nodes in parallel across available CPU threads.
#[no_mangle]
pub extern "C" fn calculate_system_entropy(nodes: Vec<SystemNode>) -> f64 {
    nodes.par_iter()
         .map(|node| {
             // Algorithmic complexity evaluation: Base weight * (dependencies ^ 1.5)
             node.entropy_weight * (node.dependencies as f64).powf(1.5)
         })
         .sum::<f64>()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_entropy_calculation() {
        let nodes = vec![
            SystemNode { id: "alpha".to_string(), entropy_weight: 1.0, dependencies: 4 },
        ];
        let result = calculate_system_entropy(nodes);
        assert_eq!(result, 8.0); // 1.0 * (4^1.5) = 8.0
    }
}
