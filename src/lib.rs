// Core Rust constraint verification algorithms for Sol-Plex-Problems

/// Evaluates node and connection ratios to programmatically categorize 
/// whether a target matrix path behaves deterministically or adaptively.
pub fn calculate_system_topology(total_nodes: u64, total_edges: u64) -> &'static str {
    if total_edges > (total_nodes * 2) {
        "Complex-Adaptive"
    } else {
        "Complicated-Deterministic"
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_topology_evaluation() {
        assert_eq!(calculate_system_topology(10, 5), "Complicated-Deterministic");
        assert_eq!(calculate_system_topology(5, 15), "Complex-Adaptive");
    }
}
