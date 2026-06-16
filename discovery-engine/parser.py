import json
import re
from typing import Dict, Any

class DiscoveryEngine:
    """Parses chaotic, unstructured inputs into deterministic problem sets."""
    def __init__(self, raw_input_path: str):
        self.raw_input_path = raw_input_path

    def analyze_entropy(self) -> Dict[str, Any]:
        with open(self.raw_input_path, 'r') as f:
            data = f.read()
        
        # Heuristic calculation of systemic complexity based on connectivity keywords
        variables = len(re.findall(r'(volatile|unknown|dynamic|feedback)', data, re.IGNORECASE))
        constraints = len(re.findall(r'(must|limit|restrict|depend)', data, re.IGNORECASE))
        
        return {
            "problem_type": "Complex" if variables > constraints else "Complicated",
            "entropy_score": float(variables / (constraints + 1)),
            "detected_nodes": list(set(re.findall(r'\b[A-Z_]{3,}\b', data)))
        }
