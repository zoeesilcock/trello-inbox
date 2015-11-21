import IdeasContainer from '../containers/IdeasContainer';
import IdeaFormContainer from '../containers/IdeaFormContainer';
import NewIdeaButtonContainer from '../containers/NewIdeaButtonContainer';

// This is how react_on_rails can see the IdeasContainer in the browser.
window.IdeasContainer = IdeasContainer;
window.IdeaFormContainer = IdeaFormContainer;
window.NewIdeaButtonContainer = NewIdeaButtonContainer;
