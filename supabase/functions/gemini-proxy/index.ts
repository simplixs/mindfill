import { serve } from "https://deno.land/std@0.168.0/http/server.ts"

const GEMINI_API_KEY = Deno.env.get("GEMINI_API_KEY")
const GEMINI_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent"

serve(async (req) => {
  const { category, query, user_level } = await req.json()

  let systemPrompt = ""
  
  if (category === 'flash_book') {
    systemPrompt = `ROLE: Academic Summarizer.
TASK: Summarize the book "${query}" in exactly 3 distinct concepts.
TONE: Intellectual, concise, dry. No emojis.
OUTPUT_FORMAT: JSON
{
  "title": "Book Title",
  "author": "Author Name",
  "slides": [
    {"concept": "Title of Concept 1", "body": "Summary text (max 250 chars)."},
    {"concept": "Title of Concept 2", "body": "Summary text (max 250 chars)."},
    {"concept": "Title of Concept 3", "body": "Summary text (max 250 chars)."}
  ],
  "reflection_question": "A deep question forcing the user to apply the concept (multiple choice or open)."
}`
  } else if (category === 'logic_pill') {
    systemPrompt = `ROLE: Logic Master.
TASK: Generate a lateral thinking puzzle or logic math problem.
DIFFICULTY: ${user_level || 5} (scale 1-10).
OUTPUT_FORMAT: JSON
{
  "type": "lateral_thinking",
  "question": "The scenario text...",
  "options": ["Option A", "Option B", "Option C"],
  "correct_answer": "Option B",
  "explanation": "Why B is correct based on logic."
}`
  }

  const response = await fetch(`${GEMINI_URL}?key=${GEMINI_API_KEY}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      contents: [{ parts: [{ text: systemPrompt }] }],
      generationConfig: {
        responseMimeType: "application/json",
      }
    })
  })

  const data = await response.json()
  const content = data.candidates[0].content.parts[0].text

  return new Response(content, {
    headers: { "Content-Type": "application/json" },
  })
})
