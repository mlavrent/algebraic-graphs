import Mathlib.Algebra.Group.Defs

class Graph (γ  : Type u) where
  empty : γ
  vertexType : Type v
  vertex : vertexType → γ
  overlay : γ → γ → γ
  connect : γ → γ → γ
  overlay_comm : Lean.IsCommutative overlay
  -- monoid_of_connect
  -- connect_distr :
  connect_decomp : ∀ (x y z : γ), connect (connect x y) z = overlay (connect x y) (overlay (connect x z) (connect y z))

section construction

variable {γ : Type u} [Graph γ]

def edge (x y : Graph.vertexType γ) : γ :=
  Graph.connect (Graph.vertex x) (Graph.vertex y)

def vertices : List (Graph.vertexType γ) → γ :=
  (List.foldr Graph.overlay Graph.empty) ∘ (List.map Graph.vertex)

def clique : List (Graph.vertexType γ) → γ :=
  (List.foldr Graph.connect Graph.empty) ∘ (List.map Graph.vertex)

theorem vertex_eq_vertices_of_single (x : Graph.vertexType γ) : Graph.vertex x = vertices [x] := by
  rw [vertices]
  sorry

  -- rw [List.foldr]

end construction
