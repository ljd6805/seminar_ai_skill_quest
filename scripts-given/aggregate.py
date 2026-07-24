#!/usr/bin/env python3
"""test_results.csv 집계 스크립트 (Lv.7 번들링용).

skill이 직접 세지 말고 이 스크립트를 실행해 결과를 그대로 사용해야 한다.
출력의 AGG-TOKEN 줄은 채점(check.sh)에서 스크립트 실행 여부를 검증하는 데 쓰인다.
"""
import csv, hashlib, sys, collections
path = sys.argv[1] if len(sys.argv) > 1 else "data/test_results.csv"
raw = open(path, "rb").read()
rows = list(csv.DictReader(open(path)))
p = sum(1 for r in rows if r["result"] == "PASS")
f = len(rows) - p
by_mod = collections.Counter(r["module"] for r in rows if r["result"] == "FAIL")
print(f"TOTAL_PASS: {p}")
print(f"TOTAL_FAIL: {f}")
for m, c in sorted(by_mod.items()):
    print(f"FAIL_{m}: {c}")
slowest = max(rows, key=lambda r: int(r["time_ms"]))
print(f"SLOWEST: {slowest['test_name']} ({slowest['time_ms']}ms)")
print(f"AGG-TOKEN: {hashlib.sha1(raw).hexdigest()[:6]}")
