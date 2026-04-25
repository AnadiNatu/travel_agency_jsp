<%@page import="io.jsonwebtoken.*, io.jsonwebtoken.security.Keys"%>
<%@page import="java.util.Date"%>
<%@page import="javax.crypto.SecretKey"%>

<%!
    private static final String SECRET = "my_super_secret_key_which_should_be_very_long_12345_ABCDE98765";
    private static final long EXPIRATION_MS = 24 * 60 * 60 * 1000;

    private SecretKey getSigningKey() {
        return Keys.hmacShaKeyFor(SECRET.getBytes());
    }

    public String generateToken(String username, String role, Integer id) {
        return Jwts.builder()
                .setSubject(username)
                .claim("role", role)
                .claim("id", id)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_MS))
                .signWith(getSigningKey(), io.jsonwebtoken.SignatureAlgorithm.HS256)
                .compact();
    }

    public boolean validateToken(String token) {
        try {
            parseToken(token);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public Jws<Claims> parseToken(String token) {
        return Jwts.parser()
                .setSigningKey(getSigningKey())
                .parseClaimsJws(token);
    }

    public String getUsernameFromToken(String token) {
        return parseToken(token).getBody().getSubject();
    }

    public String getRoleFromToken(String token) {
        return parseToken(token).getBody().get("role", String.class);
    }

    public Integer getIdFromToken(String token) {
        return parseToken(token).getBody().get("id", Integer.class);
    }
%>
