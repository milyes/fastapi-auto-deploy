def summarize(text: str) -> str:
    """Retourne une version résumée simulée du texte"""
    if len(text) < 40:
        return text
    return text[:35] + "... (résumé)"
