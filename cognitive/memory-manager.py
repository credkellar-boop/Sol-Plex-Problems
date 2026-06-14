#!/usr/bin/env python3
"""
Sol-Plex Memory State Manager
Maintains persistence loops across native cloud databases and localized execution layers.
"""

import logging
import hashlib
from typing import Dict, Any, Optional
from google.cloud import firestore_v1
import redis.asyncio as aioredis

logger = logging.getLogger("SolPlexMemory")

class AsyncMemoryManager:
    def __init__(self, project_id: str, redis_client: Optional[aioredis.Redis] = None):
        self.project_id = project_id
        self.db = firestore_v1.AsyncClient(project=self.project_id)
        self.redis = redis_client

    def generate_problem_hash(self, user_input: str) -> str:
        """Generates predictable SHA-256 fingerprint mappings for structural cache indexing."""
        return hashlib.sha256(user_input.strip().encode('utf-8')).hexdigest()

    async def commit_state(self, problem_hash: str, raw_input: str, processed_dataset: Any) -> None:
        """Stores persistent operational footprints concurrently across cache and database tiers."""
        payload = {
            "problem_hash": problem_hash,
            "user_input": raw_input,
            "data_payload": processed_dataset,
            "timestamp": firestore_v1.SERVER_TIMESTAMP
        }

        if self.redis:
            try:
                await self.redis.setex(f"solplex:memory:{problem_hash}", 3600, str(payload))
            except Exception as e:
                logger.warning(f"Failed to append data state to cache line: {str(e)}")

        try:
            doc_ref = self.db.collection("problem_states").document(problem_hash)
            await doc_ref.set(payload)
            logger.info(f"💾 State transaction successfully committed for ID: {problem_hash[:12]}")
        except Exception as e:
            logger.error(f"Failed to record state ledger in Firestore: {str(e)}")
