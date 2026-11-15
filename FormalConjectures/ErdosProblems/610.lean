/-
Copyright 2026 The Formal Conjectures Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-/
module

public import FormalConjecturesUtil

/-!
# Erdos Problem 610

*Reference:*
[erdosproblems.com/610](https://www.erdosproblems.com/610)
[JMRS21] Gwenaël Joret, Piotr Micek, Bruce Reed, Michiel Smid,
*Tight Bounds on the Clique Chromatic Number*, Combin. Discret Math. (2020)
-/

@[expose] public section

namespace Erdos610


def erdos_610_upper.answer : ℕ → ℝ := sorry

/--
Original Question: Let $G$ be a graph, and let $\tau(G)$ denote the minimum number of vertices needed to
intersect every maximal clique of $G$, excluding isolated vertices.
Estimate $\tau(G)$.

As such, splitting the problem into an upper and a lower bound is equivalent.
In the following, $\tau(G)$ is `SimpleGraph.cliqueTransversalNumber`, which also excludes isolated vertices.
Find an upper bound for $\tau(G)$.
-/
@[category research open, question value, AMS 5]
theorem erdos_610_upper :
  ∀ n : ℕ, ∀ G : SimpleGraph (Fin n),
  (G.cliqueTransversalNumber : ℝ) ≤ erdos_610_upper.answer n := by sorry

def erdos_610_lower.answer : ℕ → ℝ := sorry

/--
Find a lower bound for $\tau(G)$.
-/
@[category research open, question value, AMS 5]
theorem erdos_610_lower :
  ∀ n : ℕ, ∃ G : SimpleGraph (Fin n),
  (G.cliqueTransversalNumber : ℝ) ≥ erdos_610_lower.answer n := by sorry

def erdos_610_func.answer : ℕ → ℝ := sorry

/--
Is it true that if $G$ has $n$ vertices, then for some $\omega(n) \to \infty$,
$\tau(G) \leq n - \omega(n)\sqrt{n}$?
Note that a solution for the constant variant below also provides a solution for this problem by
$\omega(n) = c\sqrt{\log n}$.
-/
@[category research solved, question value, AMS 5]
theorem erdos_610_func :
  Filter.Tendsto erdos_610_func.answer Filter.atTop Filter.atTop ∧
  ∀ n : ℕ, ∀ G : SimpleGraph (Fin n),
  (G.cliqueTransversalNumber : ℝ) ≤ (n : ℝ) - Real.sqrt (n : ℝ) * erdos_610_func.answer n := by sorry

def erdos_610_const.answer : {c : ℝ // 0 < c} := sorry

/--
Is it true that if $G$ has $n$ vertices, then for some $c > 0$,
$\tau(G) \leq n - c\sqrt{n\log n}$?
Note that Joret, Micek, Reed and Smid prove in [JMRS21] that if $G$ is a graph on $n$ vertices,
then there exists a $k$-colouring of its vertices, for some $k \ll \sqrt{\frac{n}{\log n}}$,
such that every maximal clique (apart from isolated vertices) contains at least two colours.
[erdosproblems.com/610] tagged the problem as 'Proved (Lean)' due to a comment providing a Lean prove
utilising that result to show the existence of a $c$ as required below.
However a Lean proof for that result does not seem to be provided,
so there does not appear to exist a complete Lean proof for that claim.
-/

@[category research solved, question value, AMS 5]
theorem erdos_610_const :
  ∀ n : ℕ, ∀ G : SimpleGraph (Fin n),
  (G.cliqueTransversalNumber : ℝ) ≤ (n : ℝ) - Real.sqrt ((n : ℝ) * Real.log (n : ℝ)) * erdos_610_const.answer := by sorry

end Erdos610
