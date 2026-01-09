-- Users Table
CREATE TABLE profiles (
  id UUID REFERENCES auth.users NOT NULL PRIMARY KEY,
  username TEXT UNIQUE,
  avatar_url TEXT,
  level_category JSONB, -- { "logic": 5, "literature": 2, "science": 8 }
  neural_score INT DEFAULT 0, -- Punteggio globale
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Content Cache
CREATE TABLE content_cache (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  query_hash TEXT UNIQUE NOT NULL, -- Hash del titolo libro o topic
  category TEXT NOT NULL, -- 'flash_book', 'logic_pill', 'vocab'
  content_json JSONB NOT NULL, -- Il contenuto generato dall'AI
  created_at TIMESTAMP DEFAULT NOW()
);

-- User Progress / History
CREATE TABLE user_activity (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES profiles(id),
  content_type TEXT,
  time_spent_seconds INT,
  completed BOOLEAN DEFAULT FALSE,
  xp_earned INT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_activity ENABLE ROW LEVEL SECURITY;

-- Profiles Policies
CREATE POLICY "Public profiles are viewable by everyone." ON profiles
  FOR SELECT USING (true);

CREATE POLICY "Users can insert their own profile." ON profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can update own profile." ON profiles
  FOR UPDATE USING (auth.uid() = id);

-- Activity Policies
CREATE POLICY "Users can see their own activity." ON user_activity
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own activity." ON user_activity
  FOR INSERT WITH CHECK (auth.uid() = user_id);
