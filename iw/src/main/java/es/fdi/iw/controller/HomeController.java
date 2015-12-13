package es.fdi.iw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import es.fdi.iw.ContextInitializer;
import es.fdi.iw.model.Local;
import es.fdi.iw.model.Usuario;

/**
 * Una aplicación de ejemplo para IW.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@PersistenceContext
	private EntityManager entityManager;
	
	/**
	 * Intercepts login requests generated by the header; then continues to load normal page
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@Transactional
	public String login(
			@RequestParam("login") String formLogin,
			@RequestParam("pass") String formPass,
			@RequestParam("source") String formSource,
			HttpServletRequest request, HttpServletResponse response, 
			Model model, HttpSession session) {
		/*
		logger.info("Login attempt from '{}' while visiting '{}'", formLogin, formSource);
		
		// validate request
		if (formLogin == null || formLogin.length() < 4 || formPass == null || formPass.length() < 4) {
			model.addAttribute("loginError", "usuarios y contraseñas: 4 caracteres mínimo");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		} else {
			User u = null;
			try {
				u = (User)entityManager.createNamedQuery("userByLogin")
					.setParameter("loginParam", formLogin).getSingleResult();
				if (u.isPassValid(formPass)) {
					logger.info("pass was valid");				
					session.setAttribute("user", u);
					// sets the anti-csrf token
					getTokenForSession(session);
				} else {
					logger.info("pass was NOT valid");
					model.addAttribute("loginError", "error en usuario o contraseña");
					response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
				}
			} catch (NoResultException nre) {
				if (formPass.length() == 4) {
					// UGLY: register new users if they do not exist and pass is 4 chars long
					logger.info("no-such-user; creating user {}", formLogin);				
					User user = User.createUser(formLogin, formPass, "user");
					entityManager.persist(user);				
					session.setAttribute("user", user);
					// sets the anti-csrf token
					getTokenForSession(session);					
				} else {
					logger.info("no such login: {}", formLogin);
				}
				model.addAttribute("loginError", "error en usuario o contraseña");
			}
		}
		*/
		// redirects to view from which login was requested
		return "redirect:" + formSource;
	}
	
	/**
	 * Delete a user; return JSON indicating success or failure
	 */
	@RequestMapping(value = "/delUser", method = RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
	public ResponseEntity<String> bookAuthors(@RequestParam("id") long id,
			@RequestParam("csrf") String token, HttpSession session) {
		if ( ! isAdmin(session) || ! isTokenValid(session, token)) {
			return new ResponseEntity<String>("Error: no such user or bad auth", 
					HttpStatus.FORBIDDEN);
		} else if (entityManager.createNamedQuery("delUser")
				.setParameter("idParam", id).executeUpdate() == 1) {
			return new ResponseEntity<String>("Ok: user " + id + " removed", 
					HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("Error: no such user", 
					HttpStatus.BAD_REQUEST);
		}
	}			
	
	/**
	 * Logout (also returns to home view).
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("User '{}' logged out", session.getAttribute("user"));
		session.invalidate();
		return "redirect:home";
	}

	/**
	 * Uploads a photo for a user
	 * @param id of user 
	 * @param photo to upload
	 * @return
	 */
	@RequestMapping(value="/user", method=RequestMethod.POST)
    public @ResponseBody String handleFileUpload(@RequestParam("photo") MultipartFile photo,
    		@RequestParam("id") String id){
        if (!photo.isEmpty()) {
            try {
                byte[] bytes = photo.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(
                        		new FileOutputStream(ContextInitializer.getFile("user", id)));
                stream.write(bytes);
                stream.close();
                return "You successfully uploaded " + id + 
                		" into " + ContextInitializer.getFile("user", id).getAbsolutePath() + "!";
            } catch (Exception e) {
                return "You failed to upload " + id + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload a photo for " + id + " because the file was empty.";
        }
    }

	/**
	 * Displays user details
	 */
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user(HttpSession session, HttpServletRequest request) {		
		return "user";
	}	

	/**
	 * Displays single-book details
	 */
	@RequestMapping(value = "/book/{id}", method = RequestMethod.GET)
	public String book(@PathVariable("id") long id, HttpServletResponse response, Model model) {
	/*	Book b = entityManager.find(Book.class, id);
		if (b == null) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			logger.error("No such book: {}", id);
		} else {
			model.addAttribute("book", b);
		}
		model.addAttribute("prefix", "../");*/
		return "book";
	}	
	
	/**
	 * Delete a book
	 */
	@RequestMapping(value = "/book/{id}", method = RequestMethod.DELETE)
	@Transactional
	@ResponseBody
	public String rmbook(@PathVariable("id") long id, HttpServletResponse response, Model model) {
		/*try {
			Book b = entityManager.find(Book.class, id);
			for (Author a : b.getAuthors()) {
				a.getWritings().remove(b);
				entityManager.persist(a);
			}
			entityManager.remove(b);
			response.setStatus(HttpServletResponse.SC_OK);
			return "OK";
		} catch (NoResultException nre) {
			logger.error("No such book: {}", id, nre);
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);*/
			return "ERR";
		//}
	}		
	
	/*
	 * List all books
	 */
	@RequestMapping(value = "/books", method = RequestMethod.GET)
	@Transactional
	public String books(Model model) {
		/*model.addAttribute("books", entityManager.createNamedQuery("allBooks").getResultList());
		model.addAttribute("owners", entityManager.createNamedQuery("allUsers").getResultList());
		model.addAttribute("authors", entityManager.createNamedQuery("allAuthors").getResultList());
		*/
		return "books";
	}	
	
	/*
	 * Add a book
	 */
	@RequestMapping(value = "/book", method = RequestMethod.POST)
	@Transactional
	public String book(@RequestParam("owner") long ownerId,
			@RequestParam("authors") long[] authorIds,
			@RequestParam("title") String title,
			@RequestParam("description") String description, Model model) {
		/*Book b = new Book();
		b.setTitle(title);
		b.setDescription(description);
		for (long aid : authorIds) {
			// adding authors to book is useless, since author is the owning side (= has no mappedBy)
			Author a = entityManager.find(Author.class, aid);
			a.getWritings().add(b);
			entityManager.persist(a);
		}
		b.setOwner(entityManager.getReference(User.class, ownerId));
		entityManager.persist(b);
		entityManager.flush();
		logger.info("Book " + b.getId() + " written ok - owned by " + b.getOwner().getLogin() 
				+ " written by " + b.getAuthors());
		*/
		return "";
	}	
	/**
	 * Load book authors for a given book via post; return as JSON
	 */
	@RequestMapping(value = "/bookAuthors")
	@ResponseBody
	@Transactional // needed to allow lazy init to work
	public ResponseEntity<String> bookAuthors(@RequestParam("id") long id, HttpServletRequest request) {
		/*try {
			Book book = (Book)entityManager.find(Book.class, id);
			List<Author> authors = book.getAuthors();
			StringBuilder sb = new StringBuilder("[");
			for (Author a : authors) {
				if (sb.length()>1) sb.append(",");
				sb.append("{ "
						+ "\"id\": \"" + a.getId() + "\", "
						+ "\"familyName\": \"" + a.getFamilyName() + "\", "
						+ "\"lastName\": \"" + a.getLastName() + "\"}");
			}
			return new ResponseEntity<String>(sb + "]", HttpStatus.OK);
		} catch (NoResultException nre) {
			logger.error("No such book: {}", id, nre);
		}
		return new ResponseEntity<String>("Error: libro no existe", HttpStatus.BAD_REQUEST);		
	*/
		return null;
	}			
	
	/**
	 * Displays author details
	 */
	@RequestMapping(value = "/author/{id}", method = RequestMethod.GET)
	public String author(@PathVariable("id") long id, Model model) {		
	/*	try {
			model.addAttribute("author", entityManager.find(Author.class, id));
		} catch (NoResultException nre) {
			logger.error("No such author: {}", id, nre);
		}
		model.addAttribute("prefix", "../");*/
		return "author";
	}	
	
	/**
	 * Returns a users' photo
	 * @param id id of user to get photo from
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/user/photo", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] userPhoto(@RequestParam("id") String id) throws IOException {
	 //con esto accedo a ${base}/user/id
		/*   File f = ContextInitializer.getFile("user", id);
	    InputStream in = null;
	    if (f.exists()) {
	    	in = new BufferedInputStream(new FileInputStream(f));
	    } else {
	    	in = new BufferedInputStream(
	    			this.getClass().getClassLoader().getResourceAsStream("unknown-user.jpg"));
	    }
	    
	    return IOUtils.toByteArray(in);*/
		return null;
	}
	
	/**
	 * Toggles debug mode
	 */
	@RequestMapping(value = "/debug", method = RequestMethod.GET)
	public String debug(HttpSession session, HttpServletRequest request) {
		String formDebug = request.getParameter("debug");
		logger.info("Setting debug to {}", formDebug);
		session.setAttribute("debug", 
				"true".equals(formDebug) ? "true" : "false");
		return "redirect:/";
	}
	public static class Plato {
		private String id;
		private String[] tags;
		public Plato(String id, String ... tags) {
			this.id = id; this.tags = tags;
		}
		public String getId() { return id; }
		public String getTags() { return Arrays.toString(tags).replaceAll("[\\[\\], ]+", " ").trim(); }
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String empty(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("pageTitle", "Bienvenido a IW");
		model.addAttribute("active", "home");
		logger.info("Setting active tab: home");
		
		
		
				
		ArrayList<Plato> platos = new ArrayList<Plato>();
		platos.add(new Plato("1", "bootstrap", "html"));
		platos.add(new Plato("2", "bootstrap", "html", "wordpress"));
		platos.add(new Plato("3", "bootstrap"));
		platos.add(new Plato("4", "wordpress"));

		
		model.addAttribute("platos", platos);
		
		return "home";
	}	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		return empty(locale, model);
	}	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/acercaDe", method = RequestMethod.GET)
	public String acercaDe(Locale locale, Model model) {
		model.addAttribute("active", "acercaDe");

		return "acercaDe";
	}	
	@RequestMapping(value = "/usuario", method = RequestMethod.GET)
	public String usuario(Locale locale, Model model) {
		model.addAttribute("active", "usuario");

		return "usuario";
	}	
	@RequestMapping(value = "/comercio_externo", method = RequestMethod.GET)
	public String comercio_externo(Locale locale, Model model) {
		model.addAttribute("active", "comercio_externo");

		return "comercio_externo";
	}	
	@RequestMapping(value = "/comercio_interno", method = RequestMethod.GET)
	public String comercio_interno(Locale locale, Model model) {
		model.addAttribute("active", "comercio_interno");

		return "comercio_interno";
	}	
	@RequestMapping(value = "/administracion", method = RequestMethod.GET)
	@Transactional
	public String administracion(Locale locale, Model model) {
		model.addAttribute("active", "administracion");
		
		Usuario admin= new Usuario("Jeff la guarra", "laMasFea.jpg", "hola@oooo.com", "974587482", "admin");
		ArrayList<String> tags= new ArrayList<String>();
		tags.add("mexicana");
		tags.add("tailandesa");
		Local local= new Local("Bistro", "img/local", "Calle concha espina n�10", tags, "40234242�N 702934820438�", "10-23", admin);
		entityManager.persist(admin);
		entityManager.persist(local);
		
		//long p=1;
		//Local local2 =entityManager.find(Local.class, p);
		//System.out.println("DATOS: "+local2.getTags().toString());
		
		System.out.println("PEPEPEPEPEPE");
		//System.out.println("uuuuuuuu");
		return "administracion";
	}	
	@RequestMapping(value = "/ultimasOfertas", method = RequestMethod.GET)
	public String ultimasOfertas(Locale locale, Model model) {
		model.addAttribute("active", "ultimasOfertas");

		return "ultimasOfertas";
	}	
	@RequestMapping(value = "/ofertasMes", method = RequestMethod.GET)
	public String ofertasMes(Locale locale, Model model) {
		model.addAttribute("active", "ofertasMes");

		return "ofertasMes";
	}	

	/**
	 * A not-very-dynamic view that shows an "about us".
	 */
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	@Transactional
	public String about(Locale locale, Model model) {
		/*logger.info("User is looking up 'about us'");
		@SuppressWarnings("unchecked")
		List<User> us = (List<User>)entityManager.createQuery("select u from User u").getResultList();
		System.err.println(us.size());
		model.addAttribute("users", us);
		model.addAttribute("pageTitle", "IW: Quienes somos");*/
		return "about";
	}	
	
	/**
	 * Checks the anti-csrf token for a session against a value
	 * @param session
	 * @param token
	 * @return the token
	 */
	static boolean isTokenValid(HttpSession session, String token) {
	    Object t=session.getAttribute("csrf_token");
	    return (t != null) && t.equals(token);
	}
	
	/**
	 * Returns an anti-csrf token for a session, and stores it in the session
	 * @param session
	 * @return
	 */
	static String getTokenForSession (HttpSession session) {
	    String token=UUID.randomUUID().toString();
	    session.setAttribute("csrf_token", token);
	    return token;
	}
	
	/** 
	 * Returns true if the user is logged in and is an admin
	 */
	static boolean isAdmin(HttpSession session) {
		/*User u = (User)session.getAttribute("user");
		if (u != null) {
			return u.getRole().equals("admin");
		} else {
			return false;
		}*/
		return false;
	}
}