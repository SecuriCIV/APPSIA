-- ==============================================================================
-- SCHEMA SUPABASE POUR L'APPLICATION ÉTUDIANTE SIA
-- Phase 1 : Authentification, Profils et Filières
-- ==============================================================================

-- 1. Table des filières (Pôle Technologie, Pôle Management, Autre)
CREATE TABLE IF NOT EXISTS public.filieres (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nom TEXT NOT NULL UNIQUE,
  pole TEXT NOT NULL CHECK (pole IN ('technologie', 'management', 'autre')),
  created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Insertion initiale des filières requises
INSERT INTO public.filieres (nom, pole) VALUES
  -- Pôle Technologie
  ('Informatique', 'technologie'),
  ('Génie logiciel', 'technologie'),
  ('Réseaux et télécommunications', 'technologie'),
  ('Systèmes d''information', 'technologie'),
  ('Intelligence artificielle', 'technologie'),
  ('Cybersécurité', 'technologie'),
  ('Électronique', 'technologie'),
  ('Génie civil', 'technologie'),
  ('Génie électrique', 'technologie'),
  ('Génie mécanique', 'technologie'),
  ('Maintenance industrielle', 'technologie'),
  ('Mathématiques-informatique', 'technologie'),
  -- Pôle Management
  ('Gestion', 'management'),
  ('Comptabilité et finance', 'management'),
  ('Marketing et communication', 'management'),
  ('Commerce international', 'management'),
  ('Ressources humaines', 'management'),
  ('Banque et assurance', 'management'),
  ('Logistique et transport', 'management'),
  ('Entrepreneuriat', 'management'),
  ('Administration des affaires', 'management'),
  ('Droit des affaires', 'management'),
  ('Secrétariat de direction', 'management'),
  ('Management de projet', 'management')
ON CONFLICT (nom) DO NOTHING;

-- 2. Table des profils étudiants
CREATE TABLE IF NOT EXISTS public.profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  nom TEXT,
  universite TEXT,
  filiere TEXT,
  niveau TEXT CHECK (niveau IN ('L1', 'L2', 'L3', 'Master')),
  role TEXT NOT NULL DEFAULT 'student' CHECK (role IN ('student', 'admin')),
  created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. Activation de Row Level Security (RLS) sur TOUTES les tables
ALTER TABLE public.filieres ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- 4. Politiques de sécurité (RLS) pour la table `filieres`
-- Lecture publique ou connectée
DROP POLICY IF EXISTS "Lecture des filières par tous" ON public.filieres;
CREATE POLICY "Lecture des filières par tous" 
  ON public.filieres FOR SELECT 
  USING (true);

-- Ajout d'une filière libre (option Autre) par un utilisateur connecté
DROP POLICY IF EXISTS "Ajout d'une nouvelle filière par un utilisateur connecté" ON public.filieres;
CREATE POLICY "Ajout d'une nouvelle filière par un utilisateur connecté" 
  ON public.filieres FOR INSERT 
  WITH CHECK (auth.uid() IS NOT NULL);

-- 5. Politiques de sécurité (RLS) pour la table `profiles`
DROP POLICY IF EXISTS "Lecture des profils par les utilisateurs connectés" ON public.profiles;
CREATE POLICY "Lecture des profils par les utilisateurs connectés" 
  ON public.profiles FOR SELECT 
  USING (auth.uid() IS NOT NULL);

DROP POLICY IF EXISTS "Création de son propre profil" ON public.profiles;
CREATE POLICY "Création de son propre profil" 
  ON public.profiles FOR INSERT 
  WITH CHECK (auth.uid() = id);

DROP POLICY IF EXISTS "Modification de son propre profil" ON public.profiles;
CREATE POLICY "Modification de son propre profil" 
  ON public.profiles FOR UPDATE 
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);

-- 6. Trigger pour initialiser automatiquement la ligne profil lors de la création d'un utilisateur auth
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
BEGIN
  INSERT INTO public.profiles (id, nom, role)
  VALUES (
    new.id,
    COALESCE(new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'name', ''),
    'student'
  )
  ON CONFLICT (id) DO NOTHING;
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();
