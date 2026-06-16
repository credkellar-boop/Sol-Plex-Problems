"""
Sol-Plex-Problems: Core Source Initialization
Connects the complex analytical frameworks to the complicated execution engines.
"""

__version__ = "0.1.7"
__author__ = "Darion Kellar"

# Expose core internal modules for cleaner imports across the system
import logging

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
