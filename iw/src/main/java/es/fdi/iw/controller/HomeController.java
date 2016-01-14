package es.fdi.iw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.FileChannel;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import es.fdi.iw.ContextInitializer;
import es.fdi.iw.model.Comentario;
import es.fdi.iw.model.Local;
import es.fdi.iw.model.Oferta;
import es.fdi.iw.model.Usuario;
import scala.annotation.meta.getter;

/**
 * Una aplicación de ejemplo para IW.
 */
@SuppressWarnings("unused")
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
	@RequestMapping(value="/userfoto", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] userPhoto(@RequestParam("id") String id) throws IOException {
	 //con esto accedo a ${base}/userfoto/id
		File f = ContextInitializer.getFile("user", id);
	    InputStream in = null;
	    if (f.exists()) {
	    	in = new BufferedInputStream(new FileInputStream(f));
	    } else {
	    	in = new BufferedInputStream(
	    			this.getClass().getClassLoader().getResourceAsStream("unknown_user.jpg"));
	    }
	    return IOUtils.toByteArray(in);		
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
		model.addAttribute("pageTitle", "Bienvenido a MealNDrink");
		model.addAttribute("active", "home");
		logger.info("Setting active tab: home");
	
		String[] alltags = {"plan_romantico", "comida_india", "comida_mexicana", "comida_china", "comida_rusa",
				"comida_espa�ola", "comida_turca", "comida_picante", "comida_italiana", "comida_francesa"};		
		List<Long> idsOffers = new ArrayList<Long>(); 
		idsOffers.add((long) 8);
		idsOffers.add((long) 5);
		idsOffers.add((long) 7);
		idsOffers.add((long) 2);
		List<Long> idsLocals = new ArrayList<Long>();
		idsLocals.add((long) 4);
		idsLocals.add((long) 1);
		idsLocals.add((long) 5);
		idsLocals.add((long) 2);
		idsLocals.add((long) 3);	
		List<Long> idsBooks = new ArrayList<Long>(); 
		idsBooks.add((long) 1);
		idsBooks.add((long) 5);
		idsBooks.add((long) 2);
		idsBooks.add((long) 3);	
		
		model.addAttribute("alltags", alltags);	
		model.addAttribute("platos", entityManager.createNamedQuery("infoOffers").setParameter("idParam", idsOffers).getResultList());
	//	model.addAttribute("popularLocals", entityManager.createNamedQuery("infoLocals").setParameter("idParam", idsLocals).getResultList());
		//model.addAttribute("lastBooks", entityManager.createNamedQuery("infoBooks").setParameter("idParam", idsBooks).getResultList());
		
		
		return "home";
	}	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		return empty(locale, model);
	}	
	
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String reservaEnHome(@RequestParam("capacidad") int cap, Locale locale, Model model) {
		System.out.println("Los comensales en ultimas ofertas que vienen son " + cap);	
		return empty(locale, model);
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/acercaDe", method = RequestMethod.GET)
	public String acercaDe(Locale locale, Model model) {
		model.addAttribute("active", "acercaDe");
		model.addAttribute("pageTitle", "Acerca de");
		return "acercaDe";
	}	
	@RequestMapping(value = "/usuario", method = RequestMethod.GET)
	public String usuario(@RequestParam("id") long id,Model model) {
		model.addAttribute("active", "usuario");
		model.addAttribute("pageTitle", "User");

		Usuario usuario = entityManager.find(Usuario.class, id);

		model.addAttribute("usuario", usuario);
		return "usuario";		
	}	
	
	@Transactional
	@RequestMapping(value = "/reserva", method = RequestMethod.GET)	
	public String reserva(@RequestParam("id") long id, @RequestParam("dondeEstoy") String pag,Model model) {		
		model.addAttribute("active", "comercio_externo");			
		try {
			Oferta aux = entityManager.find(Oferta.class, id);
			model.addAttribute("infoOferta", aux);
			model.addAttribute("paginaVuelta", pag);
			model.addAttribute("pageTitle", "Reserva");
		} catch (NoResultException nre) {
			logger.error("No existe esa oferta: {}", id, nre);
		}
		
		return "reserva";
	}		
	@Transactional
	@RequestMapping(value = "/comercio_externo", method = RequestMethod.GET)	
	public String comercio_externo(@RequestParam("id") long id, Model model) {		
		model.addAttribute("active", "comercio_externo");			
		try {
			Local aux = entityManager.find(Local.class, id);
			model.addAttribute("infoLocal", aux);
			model.addAttribute("pageTitle", aux.getNombre());
		} catch (NoResultException nre) {
			logger.error("No existe ese local: {}", id, nre);
		}
		
		return "comercio_externo";
	}	

	@RequestMapping(value = "/detallesOferta", method = RequestMethod.GET)
	@ResponseBody
	public String detallesOferta(@RequestParam("id") long id) {
		Oferta o = (Oferta)entityManager.find(Oferta.class, id);

		String ret = "{nombre: " + "\""+o.getNombre()+ "\"" + ", id: " + o.getID() + "}";
		System.err.println(ret);
		return ret;
		//return o;
	}

	@Transactional
	@RequestMapping(value = "/comercio_interno", method = RequestMethod.GET)
	public String comercio_interno(@RequestParam("id") long id,Model model) {
		//Tendriamos que pasarle el LOCAL al que le das click.
		//Yo creo que es mejor que el desplegable que sale en perfil ponga (Cerrar sesi�n, perfil y los locales que tiene)
		//CAMBIAR EL HEADER!!!!!!! 
		Local local = entityManager.find(Local.class, id);
		model.addAttribute("pageTitle", local.getNombre());
		model.addAttribute("active", "comercio_interno");
		model.addAttribute("local", local);
		return "comercio_interno";
	}	
	@Transactional
	@RequestMapping(value = "/nuevaOferta", method = RequestMethod.POST)
	public String nuevaOferta(@RequestParam("fileToUpload") MultipartFile photo,
    		@RequestParam("id_local") long id, @RequestParam("name") String nombreOferta,@RequestParam("endTime") String endTime
    		, @RequestParam("cap") int capacidad,@RequestParam("description") String descripcion, Model model){
		//HABRIA QUE REVISAR ESTO PARA QUE NO SE NOS PUEDAN HACER INYECCIONES
		//REVISAR LO DE LA FECHA....O PONEMOS HORAS O PONEMOS FECHA O PONEMOS LAS DOS
		Local local = entityManager.find(Local.class, id);
		Oferta offer= new Oferta();
		offer.setNombre(nombreOferta);
		offer.setFechaLimite(new Timestamp(23)); //ENDTIME!!!!!!!!!!
		offer.setCapacidadTotal(capacidad);
		offer.setDescripcion(descripcion);
		String tags = "plan_romantico, comida_india, comida_mexicana";
		offer.setTags(tags);		
		offer.setLocal(local);
		offer.setOfertaMes(false);
		local.getOfertas().add(offer);
		
        if (!photo.isEmpty()) {
            try {
            	offer.setFoto(photo.getOriginalFilename());
                byte[] bytes = photo.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(
                        		new FileOutputStream(ContextInitializer.getFile("ofertas", ""+offer.getID())));
                stream.write(bytes);
                stream.close();

        		
            } catch (Exception e) {
            	return "redirect:comercio_interno?id="+local.getID();
            }
        } else { //no ha seleccionado foto, poner la por defecto
        	offer.setFoto("unknown_offer.jpg");
          
    	    	BufferedInputStream in = new BufferedInputStream(
    	    			this.getClass().getClassLoader().getResourceAsStream("unknown_offer.jpg"));
    	    	BufferedOutputStream stream = null;
				try {
					stream = new BufferedOutputStream(
							new FileOutputStream(ContextInitializer.getFile("ofertas", offer.getID()+".jpg")));
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					stream.write(IOUtils.toByteArray(in));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				entityManager.persist(offer);
				entityManager.persist(local);				
        }
        return "redirect:comercio_interno?id="+local.getID();
    }
	@Transactional
	@RequestMapping(value = "/eliminarOferta", method = RequestMethod.POST)
	public String eliminarOferta(@RequestParam("idOferta") long idOffer,Model model){
			Oferta oferta= entityManager.find(Oferta.class, idOffer);
			entityManager.remove(oferta);			
			return "eliminarOferta";
    }
	
	
	@Transactional
	@RequestMapping(value = "/nuevoLocal", method = RequestMethod.POST)
	public String nuevoLocal(@RequestParam("fileToUpload") MultipartFile photo,
    		@RequestParam("id_usuario") long id, @RequestParam("name") String nombreLocal,@RequestParam("timeBusiness") String horario
    		, @RequestParam("dir") String direccion,@RequestParam("email") String email,@RequestParam("tel") String telefono,
    		@RequestParam("tags") String tags,@RequestParam("redireccion")String pagina, Model model){
		//HABRIA QUE REVISAR ESTO PARA QUE NO SE NOS PUEDAN HACER INYECCIONES
		//REVISAR LO DE LA FECHA....O PONEMOS HORAS O PONEMOS FECHA O PONEMOS LAS DOS
	
		//UBICACI�N!!!!!!!!!!!!!		
		Usuario usuario = entityManager.find(Usuario.class, id);
		Local local= new Local();
		local.setNombre(nombreLocal);
		local.setDireccion(direccion);
		local.setHorario(horario);
		local.setUsuario(usuario);
		local.setTags(tags);
		local.setEmail(email);
		local.setTelefono(telefono);

        if (!photo.isEmpty()) {
            try {
            	local.setFoto(photo.getOriginalFilename());
                byte[] bytes = photo.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(
                        		new FileOutputStream(ContextInitializer.getFile(local.getID()+"_"+local.getNombre(), id + "_"+local.getFoto())));
                stream.write(bytes);
                stream.close();
                usuario.getLocales().add(local);
        		entityManager.persist(usuario);
        		entityManager.persist(local);       		
         
            } catch (Exception e) {
            	return "redirect:comercio_interno?id="+local.getID();
            }
        } else { //no ha seleccionado foto, poner la por defecto
        	local.setFoto("unknown_local.jpg");
          
    	    	BufferedInputStream in = new BufferedInputStream(
    	    			this.getClass().getClassLoader().getResourceAsStream("unknown_local.jpg"));
    	    	BufferedOutputStream stream = null;
				try {
					stream = new BufferedOutputStream(
							new FileOutputStream(ContextInitializer.getFile(local.getID()+"_"+local.getNombre(), id + "_"+local.getFoto())));
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					stream.write(IOUtils.toByteArray(in));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                usuario.getLocales().add(local);
        		entityManager.persist(usuario);
        		entityManager.persist(local);  
				
        }
		
		if(pagina.equalsIgnoreCase("usuario"))
			return "redirect:usuario?id="+id;
		else
			return "redirect:administracion";	
    }
	
	@Transactional
	@RequestMapping(value = "/eliminarLocal", method = RequestMethod.POST)
	public String eliminarLocal(@RequestParam("idLocal") long idLocal,Model model){
			Local local= entityManager.find(Local.class, idLocal);
			entityManager.remove(local);	
			return "eliminarLocal";
    }
	
	@Transactional
	@RequestMapping(value = "/editarLocal", method = RequestMethod.POST)
	public String editarLocal(@RequestParam("fileToUpload") MultipartFile photo,
    		@RequestParam("id_usuario") long id, @RequestParam("name") String nombreLocal,@RequestParam("timeBusiness") String horario
    		, @RequestParam("dir") String direccion,@RequestParam("email") String email,@RequestParam("tel") String telefono,
    		@RequestParam("tags") String tags,@RequestParam("redireccion")String pagina, Model model){
		//HABRIA QUE REVISAR ESTO PARA QUE NO SE NOS PUEDAN HACER INYECCIONES
		//REVISAR LO DE LA FECHA....O PONEMOS HORAS O PONEMOS FECHA O PONEMOS LAS DOS
		Usuario edit= entityManager.find(Usuario.class, id);

			return "redirect:usuario?id="+id;

	}
	
	@Transactional
	@RequestMapping(value = "/editarUsuario", method = RequestMethod.POST)
	public String editarUsuario(@RequestParam("fileToUpload") MultipartFile photo,
    		@RequestParam("id_usuario") long id, @RequestParam("nameUser") String nombreUsuario,@RequestParam("pwd") String pass
    		, @RequestParam("email") String email,@RequestParam("tel") String telefono,@RequestParam("redireccion")String pagina, 
    		Model model){
		//HABRIA QUE REVISAR ESTO PARA QUE NO SE NOS PUEDAN HACER INYECCIONES
		//REVISAR LO DE LA FECHA....O PONEMOS HORAS O PONEMOS FECHA O PONEMOS LAS DOS
		Usuario edit= entityManager.find(Usuario.class, id);
		
		if(!pass.equalsIgnoreCase("*****")){ //si ha cambiado
			edit.setHashedAndSalted(pass);
		}
		edit.setNombre(nombreUsuario);
		edit.setEmail(email);
		edit.setFoto(photo.getOriginalFilename());
		edit.setTelefono(telefono);
		
		if(pagina.equalsIgnoreCase("usuario"))
			return "redirect:usuario?id="+id;
		else
			return "redirect:administracion";	
	}
	
	@Transactional
	@RequestMapping(value = "/eliminarUsuario", method = RequestMethod.POST)
	public String eliminarUsuario(@RequestParam("idUsuario") long idUsuario,Model model){
			Usuario usuario= entityManager.find(Usuario.class, idUsuario);
			entityManager.remove(usuario);			
			return "eliminarUsuario";
    }

	@Transactional
	@RequestMapping(value = "/eliminarComentario", method = RequestMethod.POST)
	public String eliminarComentario(@RequestParam("idComentario") long idComentario,Model model){
			Comentario comentario= entityManager.find(Comentario.class, idComentario);
			entityManager.remove(comentario);			
			return "eliminarComentario";
    }
	
	@RequestMapping(value = "/administracion", method = RequestMethod.GET)
	@Transactional
	public String administracion(Locale locale, Model model) {
		model.addAttribute("active", "administracion");
		model.addAttribute("pageTitle", "Administracion");
		//COMPROBAR que lo que nos viene en modo get est� logueado como admin
		model.addAttribute("admin", entityManager.createNamedQuery("roleUser").setParameter("role", "admin").getSingleResult());
		model.addAttribute("usuarios", entityManager.createNamedQuery("allUsers").getResultList());
		model.addAttribute("locales", entityManager.createNamedQuery("allLocals").getResultList());
		return "administracion";
	}	
	@Transactional
	@RequestMapping(value = "/ultimasOfertas", method = RequestMethod.POST)	
	public String reservaEnUltimasOfertas(@RequestParam("capacidad") int cap, Locale locale, Model model) {		
		
		System.out.println("Los comensales en ultimas ofertas que vienen son " + cap);		
		
		return ultimasOfertas(locale,model);
	}	
	@RequestMapping(value = "/ultimasOfertas", method = RequestMethod.GET)
	@Transactional
	public String ultimasOfertas(Locale locale, Model model) {
		model.addAttribute("active", "ultimasOfertas");
		model.addAttribute("pageTitle", "�ltimas ofertas");		
				
		String[] alltags = {"plan_romantico", "comida_india", "comida_mexicana", "comida_china", "comida_rusa",
				"comida_espa�ola", "comida_turca", "comida_picante", "comida_italiana", "comida_francesa"};
				
		model.addAttribute("platos", entityManager.createNamedQuery("allOffers").getResultList());
		model.addAttribute("alltags", alltags);
		
		return "ultimasOfertas";
	}	
	
	@Transactional
	@RequestMapping(value = "/ofertasMes", method = RequestMethod.POST)	
	public String reservaEnOfertasMes(@RequestParam("capacidad") int cap, Locale locale, Model model) {		
		
		System.out.println("Los comensales en ofertas del mes que vienen son " + cap);		
		
		return ofertasMes(locale, model);
	}
	
	@RequestMapping(value = "/ofertasMes", method = RequestMethod.GET)
	@Transactional
	public String ofertasMes(Locale locale, Model model) {
		model.addAttribute("active", "ofertasMes");		
		model.addAttribute("pageTitle", "Ofertas del mes");	
		
		String[] alltags = {"plan_romantico", "comida_india", "comida_mexicana", "comida_china", "comida_rusa",
				"comida_espa�ola", "comida_turca", "comida_picante", "comida_italiana", "comida_francesa"};
				
		model.addAttribute("platos", entityManager.createNamedQuery("monthlySpecials").getResultList());
		model.addAttribute("alltags", alltags);
		
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
		model.addAttribute("pageTitle", "Quienes somos");*/
	
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